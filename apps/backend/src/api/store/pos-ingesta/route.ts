import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import {
  ContainerRegistrationKeys,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createProductsWorkflow,
  deleteProductsWorkflow,
  updateProductsWorkflow,
  updateProductVariantsWorkflow,
} from "@medusajs/medusa/core-flows"

const roundCop = (val: number) => Math.max(100, Math.round(val / 100) * 100)

// Fórmula Industrial Grandes Superficies:
// Precio = Costo / (1 - %Margen/100)
// Ej: 10% -> Costo / 0.90 | 15% -> Costo / 0.85 | 20% -> Costo / 0.80
const calcIndustrialPrice = (cost: number, marginPct: number, discountPct = 0) => {
  const safeMargin = Math.min(95, Math.max(0, Number(marginPct) || 0))
  const divisor = Math.max(0.05, (100 - safeMargin) / 100)
  const discFactor = Math.max(0.1, 1 - (Number(discountPct) || 0) / 100)
  return roundCop((cost / divisor) * discFactor)
}

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  try {
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
        "categories.id",
        "categories.name",
        "variants.id",
        "variants.title",
        "variants.sku",
        "variants.barcode",
        "variants.prices.amount",
        "variants.prices.currency_code",
      ],
    })

    const formatted = products.map((p: any) => {
      const meta = p.metadata || {}
      const variants = p.variants || []
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

      const getCop = (v: any, fallback = 0) => {
        const pr = v?.prices?.find(
          (x: any) => x.currency_code?.toLowerCase() === "cop"
        )
        return pr?.amount ?? fallback
      }

      const detalPrice = getCop(detalVar, 0)
      const mayorPrice = getCop(mayorVar, 0)
      const detalMargin = Number(meta.detal_margin_pct ?? 20)
      const mayorMargin = Number(meta.mayor_margin_pct ?? 15)
      const mayorUnits = Number(meta.mayor_units ?? 10)
      const costCop = Number(meta.cost_cop ?? (detalPrice > 0 ? detalPrice * (1 - detalMargin / 100) : 0))
      const barcode = meta.barcode || detalVar?.barcode || ""
      const pum = mayorUnits > 0 ? Math.round(mayorPrice / mayorUnits) : detalPrice

      return {
        id: p.id,
        title: p.title,
        handle: p.handle,
        barcode,
        costCop,
        detalMargin,
        mayorMargin,
        detalPrice,
        mayorPrice,
        pum,
        mayorUnits,
        detalLabel: meta.detal_label || "Unidad",
        mayorLabel: meta.mayor_label || "Empaque Mayorista",
        sede: meta.sede || "Sede Principal",
        categoryName: p.categories?.[0]?.name || "General",
        categoryId: p.categories?.[0]?.id || "",
        thumbnail: p.thumbnail,
      }
    })

    return res.json({ products: formatted, count: formatted.length })
  } catch (error: any) {
    return res.status(500).json({ error: error.message || "Error al obtener productos" })
  }
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  try {
    const body = (req.body || {}) as any
    const action = body.action || "batch-create"
    const query = req.scope.resolve(ContainerRegistrationKeys.QUERY)

    // ACCIÓN 1: CARGA MASIVA DE PRODUCTOS ESCANEADOS CON IA
    if (action === "batch-create") {
      const items = Array.isArray(body.products) ? body.products : []
      if (items.length === 0) {
        return res.status(400).json({ error: "No se proporcionaron productos para cargar" })
      }

      const { data: categories } = await query.graph({
        entity: "product_category",
        fields: ["id", "name", "handle"],
      })

      const getCatId = (name: string) => {
        const found = categories.find(
          (c: any) =>
            c.name.toLowerCase().includes((name || "").toLowerCase()) ||
            c.handle.toLowerCase().includes((name || "").toLowerCase())
        )
        return found ? found.id : categories[0]?.id
      }

      const { data: shippingProfiles } = await query.graph({
        entity: "shipping_profile",
        fields: ["id"],
      })
      const shippingProfile = shippingProfiles[0]

      const { data: salesChannels } = await query.graph({
        entity: "sales_channel",
        fields: ["id"],
      })
      const defaultSalesChannel = salesChannels[0]

      const productsPayload = items.map((item: any, idx: number) => {
        const cost = Number(item.costCop) || 1000
        const dMargin = Number(item.detalMargin ?? 20)
        const mMargin = Number(item.mayorMargin ?? 15)
        const units = Number(item.mayorUnits) || 12
        const detalPrice = item.detalPrice ? Number(item.detalPrice) : calcIndustrialPrice(cost, dMargin)
        const mayorPrice = item.mayorPrice ? Number(item.mayorPrice) : calcIndustrialPrice(cost * units, mMargin)

        // Generar código de barras GS1 770 si no viene
        const rawBarcode = item.barcode?.toString().trim()
        const barcode = rawBarcode && rawBarcode.length >= 8
          ? rawBarcode
          : `770${Math.floor(1000000000 + Math.random() * 9000000000)}`

        const safeHandle = (item.title || `producto-${idx}`)
          .toLowerCase()
          .normalize("NFD")
          .replace(/[\u0300-\u036f]/g, "")
          .replace(/[^a-z0-9]+/g, "-")
          .replace(/^-+|-+$/g, "") + `-${Date.now().toString().slice(-4)}${idx}`

        const img = item.image || item.thumbnail || "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=600&q=80"

        return {
          title: item.title,
          handle: safeHandle,
          description: item.description || `${item.title} disponible para compra al detal y por mayor en Sede Principal.`,
          status: ProductStatus.PUBLISHED,
          shipping_profile_id: shippingProfile?.id,
          category_ids: item.categoryId ? [item.categoryId] : [getCatId(item.categoryName || "General")],
          thumbnail: img,
          images: [{ url: img }],
          metadata: {
            code_ref: item.codeRef || `REF-${barcode.slice(-5)}`,
            barcode,
            detal_label: item.detalLabel || "Unidad",
            mayor_label: item.mayorLabel || `Paca/Caja x ${units}`,
            cost_cop: cost,
            detal_margin_pct: dMargin,
            mayor_margin_pct: mMargin,
            mayor_units: units,
            discount_pct: 0,
            sede: item.sede || "Sede Principal",
            stock_qty: item.stockQty || 200,
            pasillo: item.pasillo || item.categoryName || "General",
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
              sku: `DETAL-${barcode}`,
              barcode: barcode,
              manage_inventory: false,
              allow_backorder: true,
              options: { Modalidad: "Al Detal (Unidad)" },
              prices: [
                { amount: detalPrice, currency_code: "cop" },
                { amount: Math.max(1, Math.round(detalPrice / 4200)), currency_code: "eur" },
                { amount: Math.max(1, Math.round(detalPrice / 3900)), currency_code: "usd" },
              ],
            },
            {
              title: "Al por Mayor (Caja / Bulto)",
              sku: `MAYOR-${barcode}`,
              barcode: `${barcode}-M`,
              manage_inventory: false,
              allow_backorder: true,
              options: { Modalidad: "Al por Mayor (Caja / Bulto)" },
              prices: [
                { amount: mayorPrice, currency_code: "cop" },
                { amount: Math.max(1, Math.round(mayorPrice / 4200)), currency_code: "eur" },
                { amount: Math.max(1, Math.round(mayorPrice / 3900)), currency_code: "usd" },
              ],
            },
          ],
          sales_channels: defaultSalesChannel ? [{ id: defaultSalesChannel.id }] : [],
        }
      })

      const { result: created } = await createProductsWorkflow(req.scope).run({
        input: { products: productsPayload },
      })

      return res.json({
        success: true,
        count: created.length,
        message: `¡Se ingresaron exitosamente ${created.length} productos a la tienda!`,
        created,
      })
    }

    // ACCIÓN 2: ACTUALIZAR MÁRGENES (10%, 15%, 20%) Y RECALCULAR PRECIOS
    if (action === "update-margins") {
      const { productId, detalMargin, mayorMargin } = body

      const { data: prods } = await query.graph({
        entity: "product",
        fields: [
          "id",
          "title",
          "metadata",
          "variants.id",
          "variants.title",
          "variants.sku",
          "variants.prices.id",
          "variants.prices.amount",
          "variants.prices.currency_code",
        ],
        filters: productId ? { id: productId } : undefined,
      })

      for (const prod of prods) {
        const meta = (prod.metadata || {}) as any
        const cost = Number(meta.cost_cop) || 2000
        const units = Number(meta.mayor_units) || 12
        const dMargin = Number(detalMargin ?? meta.detal_margin_pct ?? 20)
        const mMargin = Number(mayorMargin ?? meta.mayor_margin_pct ?? 15)

        const newDetalPrice = calcIndustrialPrice(cost, dMargin)
        const newMayorPrice = calcIndustrialPrice(cost * units, mMargin)

        await updateProductsWorkflow(req.scope).run({
          input: {
            selector: { id: prod.id },
            update: {
              metadata: {
                ...meta,
                detal_margin_pct: dMargin,
                mayor_margin_pct: mMargin,
              },
            },
          },
        })

        const variants = prod.variants || []
        for (const v of variants) {
          const isMayor = v.title?.toLowerCase().includes("mayor") || v.sku?.startsWith("MAYOR")
          const targetAmount = isMayor ? newMayorPrice : newDetalPrice
          const prices = v.prices || []
          const updatedPrices = prices.map((pr: any) => ({
            id: pr.id,
            amount: pr.currency_code?.toLowerCase() === "cop" ? targetAmount : pr.amount,
          }))

          if (updatedPrices.length > 0) {
            await updateProductVariantsWorkflow(req.scope).run({
              input: {
                selector: { id: v.id },
                update: { prices: updatedPrices },
              },
            })
          }
        }
      }

      return res.json({ success: true, message: "Márgenes y precios actualizados correctamente" })
    }

    // ACCIÓN 3: ELIMINAR PRODUCTO
    if (action === "delete" && body.productId) {
      await deleteProductsWorkflow(req.scope).run({
        input: { ids: [body.productId] },
      })
      return res.json({ success: true, message: "Producto eliminado" })
    }

    return res.status(400).json({ error: "Acción no soportada" })
  } catch (error: any) {
    return res.status(500).json({ error: error.message || "Error al procesar solicitud" })
  }
}
