import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import {
  ContainerRegistrationKeys,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createInventoryLevelsWorkflow,
  createProductOptionsWorkflow,
  createProductsWorkflow,
  deleteProductsWorkflow,
  updateProductsWorkflow,
  updateProductVariantsWorkflow,
} from "@medusajs/medusa/core-flows"

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  const query = req.scope.resolve(ContainerRegistrationKeys.QUERY)

  const { data: products } = await query.graph({
    entity: "product",
    fields: [
      "id",
      "title",
      "handle",
      "description",
      "thumbnail",
      "status",
      "metadata",
      "images.url",
      "categories.id",
      "categories.name",
      "variants.id",
      "variants.title",
      "variants.sku",
      "variants.barcode",
      "variants.ean",
      "variants.prices.amount",
      "variants.prices.currency_code",
    ],
  })

  const { data: categories } = await query.graph({
    entity: "product_category",
    fields: ["id", "name", "handle"],
  })

  res.json({ products, categories })
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  const query = req.scope.resolve(ContainerRegistrationKeys.QUERY)
  const body = (req.body || {}) as any

  const {
    action,
    productId,
    title,
    description,
    imageUrl,
    categoryId,
    barcode,
    detalPriceCop,
    mayorPriceCop,
    detalLabel,
    mayorLabel,
  } = body

  if (action === "delete" && productId) {
    await deleteProductsWorkflow(req.scope).run({
      input: { ids: [productId] },
    })
    return res.json({ success: true })
  }

  // Update existing product (barcode, image, title, prices)
  if (action === "update" && productId) {
    const { data: existing } = await query.graph({
      entity: "product",
      fields: [
        "id",
        "metadata",
        "variants.id",
        "variants.title",
        "variants.sku",
      ],
      filters: { id: productId },
    })

    const prod = existing[0]
    if (!prod) {
      return res.status(404).json({ message: "Producto no encontrado" })
    }

    const updatedMeta = {
      ...(prod.metadata || {}),
      ...(barcode !== undefined ? { barcode } : {}),
      ...(detalLabel !== undefined ? { detal_label: detalLabel } : {}),
      ...(mayorLabel !== undefined ? { mayor_label: mayorLabel } : {}),
    }

    await updateProductsWorkflow(req.scope).run({
      input: {
        selector: { id: productId },
        update: {
          ...(title ? { title } : {}),
          ...(description !== undefined ? { description } : {}),
          ...(imageUrl
            ? { thumbnail: imageUrl, images: [{ url: imageUrl }] }
            : {}),
          ...(categoryId ? { category_ids: [categoryId] } : {}),
          metadata: updatedMeta,
        },
      },
    })

    // Update variants barcode & COP prices
    for (const v of prod.variants || []) {
      const isMayor =
        v.title?.toLowerCase().includes("mayor") ||
        v.sku?.toUpperCase().startsWith("MAYOR")
      const priceCop = isMayor
        ? Number(mayorPriceCop)
        : Number(detalPriceCop)

      const variantUpdate: any = {}
      if (barcode !== undefined) {
        variantUpdate.barcode = isMayor ? `${barcode}-M` : barcode
        variantUpdate.ean = isMayor ? `${barcode}2` : `${barcode}1`
      }
      if (!Number.isNaN(priceCop) && priceCop > 0) {
        variantUpdate.prices = [
          { amount: priceCop, currency_code: "cop" },
          { amount: Math.max(1, Math.round(priceCop / 4200)), currency_code: "eur" },
          { amount: Math.max(1, Math.round(priceCop / 3900)), currency_code: "usd" },
        ]
      }

      if (Object.keys(variantUpdate).length > 0) {
        await updateProductVariantsWorkflow(req.scope).run({
          input: {
            selector: { id: v.id },
            update: variantUpdate,
          },
        })
      }
    }

    return res.json({ success: true })
  }

  // Create new product with Barcode, Image, Detal & Mayor variants
  const { data: salesChannels } = await query.graph({
    entity: "sales_channel",
    fields: ["id"],
  })
  const defaultSalesChannel = salesChannels[0]

  const { data: shippingProfiles } = await query.graph({
    entity: "shipping_profile",
    fields: ["id"],
  })
  const shippingProfile = shippingProfiles[0]

  const { data: stockLocations } = await query.graph({
    entity: "stock_location",
    fields: ["id"],
  })
  const stockLocation = stockLocations[0]

  const { data: existingOptions } = await query.graph({
    entity: "product_option",
    fields: ["id", "title"],
  })
  let modOption = existingOptions.find((o: any) => o.title === "Modalidad")
  if (!modOption) {
    const { result: options } = await createProductOptionsWorkflow(
      req.scope
    ).run({
      input: {
        product_options: [
          {
            title: "Modalidad",
            values: ["Al Detal (Unidad)", "Al por Mayor (Caja / Bulto)"],
          },
        ],
      },
    })
    modOption = options[0]
  }

  const cleanHandle =
    (title || "producto")
      .toLowerCase()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/(^-|-$)/g, "") +
    "-" +
    Math.floor(100 + Math.random() * 900)

  const detalCopNum = Number(detalPriceCop) || 5000
  const mayorCopNum = Number(mayorPriceCop) || detalCopNum * 10
  const cleanBarcode = barcode || `770${Math.floor(1000000000 + Math.random() * 9000000000)}`
  const finalImg =
    imageUrl ||
    "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80"

  const { result: created } = await createProductsWorkflow(req.scope).run({
    input: {
      products: [
        {
          title: title || "Nuevo Producto",
          handle: cleanHandle,
          description: description || "Producto fresco disponible al detal y por mayor.",
          status: ProductStatus.PUBLISHED,
          shipping_profile_id: shippingProfile.id,
          ...(categoryId ? { category_ids: [categoryId] } : {}),
          thumbnail: finalImg,
          images: [{ url: finalImg }],
          metadata: {
            barcode: cleanBarcode,
            detal_label: detalLabel || "Unidad Estándar",
            mayor_label: mayorLabel || "Caja / Paca Mayorista",
          },
          options: [{ id: modOption.id }],
          variants: [
            {
              title: "Al Detal (Unidad)",
              sku: `DETAL-${cleanBarcode}`,
              barcode: cleanBarcode,
              ean: cleanBarcode,
              options: {
                Modalidad: "Al Detal (Unidad)",
              },
              prices: [
                { amount: detalCopNum, currency_code: "cop" },
                { amount: Math.max(1, Math.round(detalCopNum / 4200)), currency_code: "eur" },
                { amount: Math.max(1, Math.round(detalCopNum / 3900)), currency_code: "usd" },
              ],
            },
            {
              title: "Al por Mayor (Caja / Bulto)",
              sku: `MAYOR-${cleanBarcode}`,
              barcode: `${cleanBarcode}-M`,
              ean: `${cleanBarcode}2`,
              options: {
                Modalidad: "Al por Mayor (Caja / Bulto)",
              },
              prices: [
                { amount: mayorCopNum, currency_code: "cop" },
                { amount: Math.max(1, Math.round(mayorCopNum / 4200)), currency_code: "eur" },
                { amount: Math.max(1, Math.round(mayorCopNum / 3900)), currency_code: "usd" },
              ],
            },
          ],
          sales_channels: [{ id: defaultSalesChannel.id }],
        },
      ],
    },
  })

  // Seed stock automatically
  const { data: inventoryItems } = await query.graph({
    entity: "inventory_item",
    fields: ["id", "location_levels.id"],
  })
  const itemsWithoutLevels = inventoryItems.filter(
    (item: any) => !item.location_levels || item.location_levels.length === 0
  )
  if (itemsWithoutLevels.length > 0 && stockLocation) {
    await createInventoryLevelsWorkflow(req.scope).run({
      input: {
        inventory_levels: itemsWithoutLevels.map((item: any) => ({
          location_id: stockLocation.id,
          stocked_quantity: 500,
          inventory_item_id: item.id,
        })),
      },
    })
  }

  return res.json({ success: true, product: created[0] })
}
