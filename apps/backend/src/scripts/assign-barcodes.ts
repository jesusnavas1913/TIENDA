import { ExecArgs } from "@medusajs/framework/types"
import { ContainerRegistrationKeys } from "@medusajs/framework/utils"
import {
  updateProductsWorkflow,
  updateProductVariantsWorkflow,
} from "@medusajs/medusa/core-flows"

const BARCODE_MAP: Record<string, string> = {
  "aguacate-hass-organico": "7701001001018",
  "fresas-frescas-500g": "7701001001025",
  "banano-organico-exportacion": "7701001001032",
  "cafe-grano-artesanal": "7702002002015",
  "aceite-oliva-virgen-extra": "7702002002022",
  "arroz-blanco-extra-grano": "7702002002039",
  "pan-artesanal-masa-madre": "7702002002046",
  "leche-entera-fresca-1l": "7703003003012",
  "huevos-camperos-docena": "7703003003029",
  "queso-mozzarella-fresco": "7703003003036",
  "lomo-res-madurado": "7704004004019",
  "pechuga-pollo-fresca": "7704004004026",
  "jugo-naranja-exprimido": "7705005005016",
  "agua-mineral-manantial": "7705005005023",
  "detergente-liquido-ecologico": "7706006006013",
  "papel-higienico-triple-hoja": "7706006006020",
}

export default async function assignBarcodes({ container }: ExecArgs) {
  const query = container.resolve(ContainerRegistrationKeys.QUERY)
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)

  const { data: products } = await query.graph({
    entity: "product",
    fields: ["id", "handle", "metadata", "variants.id", "variants.title", "variants.sku"],
  })

  for (let i = 0; i < products.length; i++) {
    const p = products[i]
    const barcode =
      BARCODE_MAP[p.handle] || `7709900000${String(i + 10).padStart(3, "0")}`

    await updateProductsWorkflow(container).run({
      input: {
        selector: { id: p.id },
        update: {
          metadata: {
            ...(p.metadata || {}),
            barcode,
          },
        },
      },
    })

    for (const v of p.variants || []) {
      const isMayor =
        v.title?.toLowerCase().includes("mayor") ||
        v.sku?.toUpperCase().startsWith("MAYOR")
      await updateProductVariantsWorkflow(container).run({
        input: {
          selector: { id: v.id },
          update: {
            barcode: isMayor ? `${barcode}-M` : barcode,
            ean: isMayor ? `${barcode}2` : `${barcode}1`,
          },
        },
      })
    }
  }

  logger.info(`Asignados códigos de barras 770 a ${products.length} productos.`)
}
