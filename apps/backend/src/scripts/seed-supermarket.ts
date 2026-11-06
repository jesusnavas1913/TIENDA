import { ExecArgs } from "@medusajs/framework/types"
import {
  ContainerRegistrationKeys,
  Modules,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createInventoryLevelsWorkflow,
  createProductCategoriesWorkflow,
  createProductOptionsWorkflow,
  createProductsWorkflow,
} from "@medusajs/medusa/core-flows"

export default async function seedSupermarket({ container }: ExecArgs) {
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)
  const query = container.resolve(ContainerRegistrationKeys.QUERY)

  logger.info("Seeding Supermarket products...")

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

  const { result: categories } = await createProductCategoriesWorkflow(
    container
  ).run({
    input: {
      product_categories: [
        { name: "Frutas y Verduras", is_active: true },
        { name: "Despensa y Abarrotes", is_active: true },
        { name: "Lácteos y Huevos", is_active: true },
        { name: "Bebidas y Snacks", is_active: true },
      ],
    },
  })

  const getCatId = (name: string) =>
    categories.find((c) => c.name === name)?.id || categories[0].id

  const { result: options } = await createProductOptionsWorkflow(container).run(
    {
      input: {
        product_options: [
          {
            title: "Presentación",
            values: ["Unidad", "Pack Ahorro"],
          },
        ],
      },
    }
  )
  const presOption = options[0]

  const supermarketProducts = [
    {
      title: "Aguacate Hass Orgánico (Malla 500g)",
      handle: "aguacate-hass-organico",
      category: "Frutas y Verduras",
      description:
        "Aguacates Hass frescos seleccionados en su punto óptimo de maduración. Ideales para ensaladas, tostadas y guacamole.",
      image:
        "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80",
      eur: 4,
      usd: 5,
    },
    {
      title: "Fresas Frescas Seleccionadas (500g)",
      handle: "fresas-frescas-500g",
      category: "Frutas y Verduras",
      description:
        "Fresas dulces de cosecha local, lavadas y listas para consumir o preparar postres y batidos.",
      image:
        "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80",
      eur: 3,
      usd: 4,
    },
    {
      title: "Café en Grano Tostado Artesanal (500g)",
      handle: "cafe-grano-artesanal",
      category: "Despensa y Abarrotes",
      description:
        "Café 100% Arábica de altura con notas achocolatadas y aroma intenso. Tostado medio ideal para espresso o prensa francesa.",
      image:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80",
      eur: 9,
      usd: 11,
    },
    {
      title: "Aceite de Oliva Virgen Extra (750ml)",
      handle: "aceite-oliva-virgen-extra",
      category: "Despensa y Abarrotes",
      description:
        "Extracción en frío de aceitunas seleccionadas. Sabor equilibrado para aderezos y alta cocina.",
      image:
        "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80",
      eur: 12,
      usd: 14,
    },
    {
      title: "Leche Entera Fresca Pasteurizada (1L)",
      handle: "leche-entera-fresca-1l",
      category: "Lácteos y Huevos",
      description:
        "Leche 100% natural de granjas certificadas, rica en calcio y vitaminas A y D.",
      image:
        "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80",
      eur: 2,
      usd: 3,
    },
    {
      title: "Huevos Camperos Orgánicos (Docena)",
      handle: "huevos-camperos-docena",
      category: "Lácteos y Huevos",
      description:
        "Estuche de 12 huevos frescos de gallinas libres de jaula alimentadas con granos naturales.",
      image:
        "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80",
      eur: 4,
      usd: 5,
    },
    {
      title: "Jugo de Naranja 100% Exprimido (1L)",
      handle: "jugo-naranja-exprimido",
      category: "Bebidas y Snacks",
      description:
        "Sin azúcar añadida ni conservantes. Exprimido de naranjas frescas recién recolectadas.",
      image:
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80",
      eur: 3,
      usd: 4,
    },
    {
      title: "Pan Artesanal de Masa Madre (Hogaza)",
      handle: "pan-artesanal-masa-madre",
      category: "Despensa y Abarrotes",
      description:
        "Horneado diariamente con fermentación lenta de 24 horas. Corteza crujiente y miga suave.",
      image:
        "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80",
      eur: 5,
      usd: 6,
    },
  ]

  const { result: createdProducts } = await createProductsWorkflow(
    container
  ).run({
    input: {
      products: supermarketProducts.map((item) => ({
        title: item.title,
        handle: item.handle,
        description: item.description,
        status: ProductStatus.PUBLISHED,
        shipping_profile_id: shippingProfile.id,
        category_ids: [getCatId(item.category)],
        thumbnail: item.image,
        images: [{ url: item.image }],
        options: [{ id: presOption.id }],
        variants: [
          {
            title: "Unidad",
            sku: `SKU-${item.handle.toUpperCase()}-1`,
            options: {
              Presentación: "Unidad",
            },
            prices: [
              { amount: item.eur, currency_code: "eur" },
              { amount: item.usd, currency_code: "usd" },
            ],
          },
        ],
        sales_channels: [{ id: defaultSalesChannel.id }],
      })),
    },
  })

  logger.info(`Created ${createdProducts.length} supermarket products.`)

  const { data: inventoryItems } = await query.graph({
    entity: "inventory_item",
    fields: ["id", "location_levels.id"],
  })

  const itemsWithoutLevels = inventoryItems.filter(
    (item: any) => !item.location_levels || item.location_levels.length === 0
  )

  if (itemsWithoutLevels.length > 0) {
    await createInventoryLevelsWorkflow(container).run({
      input: {
        inventory_levels: itemsWithoutLevels.map((item: any) => ({
          location_id: stockLocation.id,
          stocked_quantity: 500,
          inventory_item_id: item.id,
        })),
      },
    })
  }

  logger.info("Finished seeding supermarket inventory!")
}

