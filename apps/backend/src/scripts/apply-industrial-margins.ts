import { ExecArgs } from "@medusajs/framework/types"
import { ContainerRegistrationKeys } from "@medusajs/framework/utils"
import {
  updateProductsWorkflow,
  updateProductVariantsWorkflow,
} from "@medusajs/medusa/core-flows"

const roundCop = (val: number) => Math.max(100, Math.round(val))

// Fórmula Grandes Industrias: Precio = Costo / (1 - %/100)
// 20% -> Costo / 0.80 | 15% -> Costo / 0.85
const calcIndustrialPrice = (cost: number, marginPct: number) => {
  const divisor = Math.max(0.05, (100 - marginPct) / 100)
  return roundCop(cost / divisor)
}

export default async function applyIndustrialMargins({ container }: ExecArgs) {
  const query = container.resolve(ContainerRegistrationKeys.QUERY)

  const { data: products } = await query.graph({
    entity: "product",
    fields: [
      "id",
      "title",
      "metadata",
      "variants.id",
      "variants.title",
      "variants.sku",
      "variants.prices.amount",
      "variants.prices.currency_code",
    ],
  })

  for (const prod of products) {
    const variants = prod.variants || []
    const detalVar =
      variants.find(
        (v: any) =>
          v.title?.toLowerCase().includes("detal") ||
          v.sku?.toUpperCase().startsWith("DETAL")
      ) || variants[0]

    const copPriceObj = detalVar?.prices?.find(
      (pr: any) => pr.currency_code?.toLowerCase() === "cop"
    )
    const currentDetal = copPriceObj?.amount ?? 5000
    const meta = (prod.metadata || {}) as Record<string, any>

    // Costo base real (si no existe, se despeja con Precio * 0.80)
    const baseCost = Number(meta.cost_cop) || roundCop(currentDetal * 0.8)
    const unitsInMayor = Number(meta.mayor_units) || 10
    const detalMargin = 20 // Estándar 20% -> ÷ 0.80
    const mayorMargin = 15 // Estándar 15% -> ÷ 0.85

    const newDetalPrice = calcIndustrialPrice(baseCost, detalMargin)
    const newMayorPrice = calcIndustrialPrice(
      baseCost * unitsInMayor,
      mayorMargin
    )

    await updateProductsWorkflow(container).run({
      input: {
        selector: { id: prod.id },
        update: {
          metadata: {
            ...meta,
            cost_cop: baseCost,
            detal_margin_pct: detalMargin,
            mayor_margin_pct: mayorMargin,
            mayor_units: unitsInMayor,
            discount_pct: Number(meta.discount_pct || 0),
          },
        },
      },
    })

    for (const v of variants) {
      const isMayor =
        v.title?.toLowerCase().includes("mayor") ||
        v.sku?.toUpperCase().startsWith("MAYOR")
      const targetAmount = isMayor ? newMayorPrice : newDetalPrice

      await updateProductVariantsWorkflow(container).run({
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

    console.log(
      `[OK] ${prod.title}: Costo=$${baseCost} | Detal(20% ÷0.80)=$${newDetalPrice} | Mayor(15% ÷0.85 x${unitsInMayor}u)=$${newMayorPrice}`
    )
  }
}

