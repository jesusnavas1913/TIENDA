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

const roundCop = (val: number) => Math.max(100, Math.round(val))

// Fórmula Grandes Industrias (Margen Bruto sobre Precio de Venta):
// Precio Venta = Costo / (1 - %Margen/100)
// Ej: 20% -> Costo / 0.80 | 15% -> Costo / 0.85
const calcIndustrialPrice = (
  cost: number,
  marginPct: number,
  discountPct = 0
) => {
  const safeMargin = Math.min(95, Math.max(-90, Number(marginPct) || 0))
  const divisor = Math.max(0.05, (100 - safeMargin) / 100)
  const discountFactor = Math.max(0.1, 1 - (Number(discountPct) || 0) / 100)
  return roundCop((cost / divisor) * discountFactor)
}

const inferCostFromIndustrialPrice = (price: number, marginPct = 20) => {
  const safeMargin = Math.min(95, Math.max(0, Number(marginPct) || 20))
  const divisor = Math.max(0.05, (100 - safeMargin) / 100)
  return roundCop(price * divisor)
}

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
    costCop,
    detalMarginPct,
    mayorMarginPct,
    mayorUnits,
    discountPct,
    detalPriceCop,
    mayorPriceCop,
    detalLabel,
    mayorLabel,
    // Bulk global percentage parameters
    targetScope,
    globalDetalMarginPct,
    globalMayorMarginPct,
    globalDiscountPct,
    globalPriceAdjustPct,
  } = body

  if (action === "delete" && productId) {
    await deleteProductsWorkflow(req.scope).run({
      input: { ids: [productId] },
    })
    return res.json({ success: true })
  }

  // BULK / GLOBAL PERCENTAGE UPDATE ACROSS ALL OR CATEGORY PRODUCTS
  if (action === "bulk-percentage") {
    const { data: allProducts } = await query.graph({
      entity: "product",
      fields: [
        "id",
        "title",
        "metadata",
        "categories.id",
        "variants.id",
        "variants.title",
        "variants.sku",
        "variants.prices.amount",
        "variants.prices.currency_code",
      ],
    })

    const targetProducts = allProducts.filter((p: any) => {
      if (!targetScope || targetScope === "all") return true
      return p.categories?.some((c: any) => c.id === targetScope)
    })

    let updatedCount = 0

    for (const prod of targetProducts) {
      const variants = prod.variants || []
      const detalVar =
        variants.find(
          (v: any) =>
            v.title?.toLowerCase().includes("detal") ||
            v.sku?.toUpperCase().startsWith("DETAL")
        ) || variants[0]
      const mayorVar =
        variants.find(
          (v: any) =>
            v.title?.toLowerCase().includes("mayor") ||
            v.sku?.toUpperCase().startsWith("MAYOR")
        ) || variants[1]

      const getCop = (v: any, fallback: number) => {
        const p = v?.prices?.find(
          (pr: any) => pr.currency_code?.toLowerCase() === "cop"
        )
        return p?.amount ?? fallback
      }

      const currentDetal = getCop(detalVar, 6500)
      const currentMayor = getCop(mayorVar, 52000)
      const meta = (prod.metadata || {}) as Record<string, any>

      const baseCost =
        Number(meta.cost_cop) || inferCostFromIndustrialPrice(currentDetal, 20)
      const unitsInMayor = Number(meta.mayor_units) || 10
      const dMargin =
        globalDetalMarginPct !== undefined && globalDetalMarginPct !== ""
          ? Number(globalDetalMarginPct)
          : Number(meta.detal_margin_pct ?? 20)
      const mMargin =
        globalMayorMarginPct !== undefined && globalMayorMarginPct !== ""
          ? Number(globalMayorMarginPct)
          : Number(meta.mayor_margin_pct ?? 15)
      const disc =
        globalDiscountPct !== undefined && globalDiscountPct !== ""
          ? Number(globalDiscountPct)
          : Number(meta.discount_pct ?? 0)

      let newDetal = currentDetal
      let newMayor = currentMayor

      if (
        globalPriceAdjustPct !== undefined &&
        globalPriceAdjustPct !== "" &&
        Number(globalPriceAdjustPct) !== 0
      ) {
        // Direct percentage increase/decrease on current prices (e.g. +10% or -5%)
        const factor = 1 + Number(globalPriceAdjustPct) / 100
        newDetal = roundCop(currentDetal * factor)
        newMayor = roundCop(currentMayor * factor)
      } else {
        // Fórmula Grandes Industrias: Precio Venta = Costo / (1 - %/100)
        // Ej: 20% -> Costo / 0.80 | 15% -> Costo / 0.85
        newDetal = calcIndustrialPrice(baseCost, dMargin, disc)
        newMayor = calcIndustrialPrice(
          baseCost * unitsInMayor,
          mMargin,
          disc
        )
      }

      await updateProductsWorkflow(req.scope).run({
        input: {
          selector: { id: prod.id },
          update: {
            metadata: {
              ...meta,
              cost_cop: baseCost,
              detal_margin_pct: dMargin,
              mayor_margin_pct: mMargin,
              mayor_units: unitsInMayor,
              discount_pct: disc,
            },
          },
        },
      })

      for (const v of variants) {
        const isMayor =
          v.title?.toLowerCase().includes("mayor") ||
          v.sku?.toUpperCase().startsWith("MAYOR")
        const targetAmount = isMayor ? newMayor : newDetal

        await updateProductVariantsWorkflow(req.scope).run({
          input: {
            selector: { id: v.id },
            update: {
              prices: [
                { amount: targetAmount, currency_code: "cop" },
                {
                  amount: Math.max(1, Math.round(targetAmount / 4200)),
                  currency_code: "eur",
                },
                {
                  amount: Math.max(1, Math.round(targetAmount / 3900)),
                  currency_code: "usd",
                },
              ],
            },
          },
        })
      }

      updatedCount++
    }

    return res.json({ success: true, updatedCount })
  }

  // CREATE OR UPSERT BY BARCODE (IF SCANNED BARCODE ALREADY EXISTS, UPDATE IT CLEANLY)
  if (barcode && String(barcode).trim()) {
    const cleanBc = String(barcode).trim()
    const { data: allExisting } = await query.graph({
      entity: "product",
      fields: ["id", "title", "metadata", "variants.id", "variants.title", "variants.sku", "variants.barcode"],
    })
    const matched = allExisting.find(
      (p: any) =>
        p.metadata?.barcode === cleanBc ||
        p.variants?.some((v: any) => v.barcode === cleanBc)
    )
    if (matched && !productId) {
      // Redirect create into update if barcode already exists
      body.action = "update"
      body.productId = matched.id
      return POST(req, res)
    }
  }

  // UPDATE SINGLE PRODUCT (BARCODE, IMAGE, MARGINS %, PRICES)
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
      ...(costCop !== undefined ? { cost_cop: Number(costCop) } : {}),
      ...(detalMarginPct !== undefined
        ? { detal_margin_pct: Number(detalMarginPct) }
        : {}),
      ...(mayorMarginPct !== undefined
        ? { mayor_margin_pct: Number(mayorMarginPct) }
        : {}),
      ...(mayorUnits !== undefined ? { mayor_units: Number(mayorUnits) } : {}),
      ...(discountPct !== undefined
        ? { discount_pct: Number(discountPct) }
        : {}),
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
          {
            amount: Math.max(1, Math.round(priceCop / 4200)),
            currency_code: "eur",
          },
          {
            amount: Math.max(1, Math.round(priceCop / 3900)),
            currency_code: "usd",
          },
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

  // CREATE NEW PRODUCT WITH COST, PERCENTAGES & BARCODE
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
  const cleanBarcode =
    barcode || `770${Math.floor(1000000000 + Math.random() * 9000000000)}`
  const finalImg =
    imageUrl ||
    "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80"

  const { result: created } = await createProductsWorkflow(req.scope).run({
    input: {
      products: [
        {
          title: title || "Nuevo Producto",
          handle: cleanHandle,
          description:
            description || "Producto fresco disponible al detal y por mayor.",
          status: ProductStatus.PUBLISHED,
          shipping_profile_id: shippingProfile.id,
          ...(categoryId ? { category_ids: [categoryId] } : {}),
          thumbnail: finalImg,
          images: [{ url: finalImg }],
          metadata: {
            barcode: cleanBarcode,
            detal_label: detalLabel || "Unidad Estándar",
            mayor_label: mayorLabel || "Caja / Paca Mayorista",
            cost_cop:
              Number(costCop) || inferCostFromIndustrialPrice(detalCopNum, 20),
            detal_margin_pct: Number(detalMarginPct ?? 20),
            mayor_margin_pct: Number(mayorMarginPct ?? 15),
            mayor_units: Number(mayorUnits ?? 10),
            discount_pct: Number(discountPct ?? 0),
          },
          options: [
            {
              title: "Modalidad",
              values: ["Al Detal (Unidad)", "Al por Mayor (Caja / Bulto)"],
            },
          ],
          variants: [
            {
              title: "Al Detal (Unidad)",
              sku: `DETAL-${cleanBarcode}`,
              barcode: cleanBarcode,
              ean: `${cleanBarcode}1`,
              options: {
                Modalidad: "Al Detal (Unidad)",
              },
              prices: [
                { amount: detalCopNum, currency_code: "cop" },
                {
                  amount: Math.max(1, Math.round(detalCopNum / 4200)),
                  currency_code: "eur",
                },
                {
                  amount: Math.max(1, Math.round(detalCopNum / 3900)),
                  currency_code: "usd",
                },
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
                {
                  amount: Math.max(1, Math.round(mayorCopNum / 4200)),
                  currency_code: "eur",
                },
                {
                  amount: Math.max(1, Math.round(mayorCopNum / 3900)),
                  currency_code: "usd",
                },
              ],
            },
          ],
          sales_channels: [{ id: defaultSalesChannel.id }],
        },
      ],
    },
  })

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
