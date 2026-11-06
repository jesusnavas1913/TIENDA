import { ExecArgs } from "@medusajs/framework/types"
import {
  ContainerRegistrationKeys,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createInventoryLevelsWorkflow,
  createProductCategoriesWorkflow,
  createProductOptionsWorkflow,
  createProductsWorkflow,
  deleteProductCategoriesWorkflow,
  deleteProductsWorkflow,
} from "@medusajs/medusa/core-flows"

export default async function seedWholesaleRetail({ container }: ExecArgs) {
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)
  const query = container.resolve(ContainerRegistrationKeys.QUERY)

  logger.info("Limpiando productos antiguos de ropa (Medusa default)...")

  const { data: existingProducts } = await query.graph({
    entity: "product",
    fields: ["id", "handle", "title"],
  })

  // Delete all existing products so we re-create a clean, well-organized catalog with both Unidad (Detal) and Caja Mayorista (Al por Mayor) variants
  if (existingProducts.length > 0) {
    await deleteProductsWorkflow(container).run({
      input: {
        ids: existingProducts.map((p: any) => p.id),
      },
    })
    logger.info(`Eliminados ${existingProducts.length} productos anteriores.`)
  }

  const { data: existingCats } = await query.graph({
    entity: "product_category",
    fields: ["id", "name"],
  })

  if (existingCats.length > 0) {
    await deleteProductCategoriesWorkflow(container).run({
      input: existingCats.map((c: any) => c.id),
    })
  }

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

  logger.info("Creando categorías de Supermercado (Mayor y Detal)...")

  const { result: categories } = await createProductCategoriesWorkflow(
    container
  ).run({
    input: {
      product_categories: [
        { name: "Frutas y Verduras", handle: "frutas-y-verduras", is_active: true },
        { name: "Despensa y Abarrotes", handle: "despensa-y-abarrotes", is_active: true },
        { name: "Lácteos y Huevos", handle: "lacteos-y-huevos", is_active: true },
        { name: "Carnes y Charcutería", handle: "carnes-y-charcuteria", is_active: true },
        { name: "Bebidas y Licores", handle: "bebidas-y-licores", is_active: true },
        { name: "Aseo y Hogar", handle: "aseo-y-hogar", is_active: true },
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
            title: "Modalidad",
            values: ["Al Detal (Unidad)", "Al por Mayor (Caja / Bulto)"],
          },
        ],
      },
    }
  )
  const modOption = options[0]

  const catalog = [
    // 1. FRUTAS Y VERDURAS
    {
      title: "Aguacate Hass Orgánico Seleccionado",
      handle: "aguacate-hass-organico",
      category: "Frutas y Verduras",
      description:
        "Aguacates Hass cremosos de exportación. Disponibles por malla individual para el hogar o por canastilla de 10kg para restaurantes y negocios.",
      image:
        "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80",
      detalEur: 4,
      mayorEur: 32,
      detalLabel: "Malla x 500g",
      mayorLabel: "Canastilla x 10kg (Ahorra 20%)",
    },
    {
      title: "Fresas Frescas Premium del Valle",
      handle: "fresas-frescas-500g",
      category: "Frutas y Verduras",
      description:
        "Fresas dulces recién recolectadas, lavadas y clasificadas. Venta al detal en bandeja o caja mayorista para repostería y juguerías.",
      image:
        "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80",
      detalEur: 3,
      mayorEur: 24,
      detalLabel: "Bandeja x 500g",
      mayorLabel: "Caja x 10 Bandejas (Ahorra 20%)",
    },
    {
      title: "Plátano / Banano Orgánico de Exportación",
      handle: "banano-organico-exportacion",
      category: "Frutas y Verduras",
      description:
        "Bananos dulces ricos en potasio y energía natural. Llévalos por mano familiar o por caja cerrada a precio de distribuidor.",
      image:
        "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80",
      detalEur: 2,
      mayorEur: 18,
      detalLabel: "Mano x 1kg",
      mayorLabel: "Caja Mayorista x 12kg",
    },

    // 2. DESPENSA Y ABARROTES
    {
      title: "Café en Grano Tostado Artesanal",
      handle: "cafe-grano-artesanal",
      category: "Despensa y Abarrotes",
      description:
        "Café 100% Arábica de altura con notas achocolatadas. Ideal para el hogar o abastecimiento mayorista de cafeterías y oficinas.",
      image:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80",
      detalEur: 9,
      mayorEur: 85,
      detalLabel: "Bolsa x 500g",
      mayorLabel: "Paca x 12 Bolsas (6kg)",
    },
    {
      title: "Aceite de Oliva Virgen Extra Gourmet",
      handle: "aceite-oliva-virgen-extra",
      category: "Despensa y Abarrotes",
      description:
        "Primera extracción en frío de aceitunas seleccionadas. Disponible por botella de 750ml o caja de 6 unidades para cocinas profesionales.",
      image:
        "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80",
      detalEur: 12,
      mayorEur: 58,
      detalLabel: "Botella x 750ml",
      mayorLabel: "Caja x 6 Botellas",
    },
    {
      title: "Arroz Blanco Extra Grano Entero",
      handle: "arroz-blanco-extra-grano",
      category: "Despensa y Abarrotes",
      description:
        "Arroz seleccionado que rinde más y queda suelto siempre. Compra por bolsa de kilo o por arroba/paca mayorista al mejor precio.",
      image:
        "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80",
      detalEur: 2,
      mayorEur: 38,
      detalLabel: "Bolsa x 1kg",
      mayorLabel: "Paca Mayorista x 25kg",
    },
    {
      title: "Pan Artesanal de Masa Madre",
      handle: "pan-artesanal-masa-madre",
      category: "Despensa y Abarrotes",
      description:
        "Horneado diariamente con fermentación lenta de 24 horas. Corteza crujiente y miga suave para el hogar o restaurantes.",
      image:
        "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80",
      detalEur: 5,
      mayorEur: 40,
      detalLabel: "Hogaza x 650g",
      mayorLabel: "Lote x 10 Hogazas",
    },

    // 3. LÁCTEOS Y HUEVOS
    {
      title: "Leche Entera Fresca Pasteurizada",
      handle: "leche-entera-fresca-1l",
      category: "Lácteos y Huevos",
      description:
        "Leche 100% natural de granjas certificadas, rica en calcio y vitaminas A y D. Lleva por litro o paca cerrada de 12 litros.",
      image:
        "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80",
      detalEur: 2,
      mayorEur: 19,
      detalLabel: "Caja x 1 Litro",
      mayorLabel: "Paca x 12 Litros",
    },
    {
      title: "Huevos Camperos Orgánicos AA",
      handle: "huevos-camperos-docena",
      category: "Lácteos y Huevos",
      description:
        "Huevos frescos de gallinas libres de jaula alimentadas con maíz natural. Disponibles por docena o por caja de 12 panales (360 uds).",
      image:
        "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80",
      detalEur: 4,
      mayorEur: 72,
      detalLabel: "Cubeta x 12 uds",
      mayorLabel: "Caja Mayorista x 360 uds",
    },
    {
      title: "Queso Mozzarella Fresco Artesanal",
      handle: "queso-mozzarella-fresco",
      category: "Lácteos y Huevos",
      description:
        "Queso doble crema y mozzarella de fundido perfecto. Ideal para sándwiches en casa o pizzerías y negocios de comida rápida.",
      image:
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80",
      detalEur: 6,
      mayorEur: 48,
      detalLabel: "Bloque x 500g",
      mayorLabel: "Barra Mayorista x 5kg",
    },

    // 4. CARNES Y CHARCUTERÍA
    {
      title: "Corte Premium Lomo de Res Madurado",
      handle: "lomo-res-madurado",
      category: "Carnes y Charcutería",
      description:
        "Carne de res seleccionada con maduración controlada al vacío para máxima suavidad y jugosidad en parrilla o sartén.",
      image:
        "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80",
      detalEur: 14,
      mayorEur: 110,
      detalLabel: "Bandeja x 500g",
      mayorLabel: "Pieza Entera al Vacío x 5kg",
    },
    {
      title: "Pechuga de Pollo Fresca Sin Hueso",
      handle: "pechuga-pollo-fresca",
      category: "Carnes y Charcutería",
      description:
        "Filetes de pechuga limpia de granja, sin hormonas ni marinados artificiales. Lista para porcionar en casa o negocio.",
      image:
        "https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80",
      detalEur: 7,
      mayorEur: 55,
      detalLabel: "Bandeja x 1kg",
      mayorLabel: "Caja Mayorista x 10kg",
    },

    // 5. BEBIDAS Y LICORES
    {
      title: "Jugo de Naranja 100% Exprimido Natural",
      handle: "jugo-naranja-exprimido",
      category: "Bebidas y Licores",
      description:
        "Sin azúcar añadida ni conservantes. Exprimido de naranjas frescas recién recolectadas en botella individual o six-pack.",
      image:
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80",
      detalEur: 3,
      mayorEur: 28,
      detalLabel: "Botella x 1L",
      mayorLabel: "Caja x 12 Botellas",
    },
    {
      title: "Agua Mineral Natural de Manantial",
      handle: "agua-mineral-manantial",
      category: "Bebidas y Licores",
      description:
        "Agua pura de manantial de montaña con minerales equilibrados. Venta individual o por paca mayorista para eventos y comercios.",
      image:
        "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80",
      detalEur: 1,
      mayorEur: 16,
      detalLabel: "Botella x 1.5L",
      mayorLabel: "Paca Mayorista x 24 uds",
    },

    // 6. ASEO Y HOGAR
    {
      title: "Detergente Líquido Ecológico Concentrado",
      handle: "detergente-liquido-ecologico",
      category: "Aseo y Hogar",
      description:
        "Fórmula biodegradable de alto poder quitamanchas y aroma fresco duradero. Cuida tu ropa y el medio ambiente.",
      image:
        "https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80",
      detalEur: 8,
      mayorEur: 58,
      detalLabel: "Galón x 3 Litros",
      mayorLabel: "Bidón Institucional x 20L",
    },
    {
      title: "Papel Higiénico Triple Hoja Ultra Suave",
      handle: "papel-higienico-triple-hoja",
      category: "Aseo y Hogar",
      description:
        "Máxima suavidad, absorción y rendimiento con extracto de algodón. Disponible en paquete familiar o fardo mayorista.",
      image:
        "https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80",
      detalEur: 6,
      mayorEur: 45,
      detalLabel: "Paquete x 12 Rollos",
      mayorLabel: "Fardo Mayorista x 96 Rollos",
    },
  ]

  const { result: createdProducts } = await createProductsWorkflow(
    container
  ).run({
    input: {
      products: catalog.map((item) => ({
        title: item.title,
        handle: item.handle,
        description: item.description,
        status: ProductStatus.PUBLISHED,
        shipping_profile_id: shippingProfile.id,
        category_ids: [getCatId(item.category)],
        thumbnail: item.image,
        images: [{ url: item.image }],
        metadata: {
          detal_label: item.detalLabel,
          mayor_label: item.mayorLabel,
          category_name: item.category,
        },
        options: [{ id: modOption.id }],
        variants: [
          {
            title: "Al Detal (Unidad)",
            sku: `DETAL-${item.handle.toUpperCase()}`,
            options: {
              Modalidad: "Al Detal (Unidad)",
            },
            prices: [
              { amount: item.detalEur, currency_code: "eur" },
              { amount: Math.round(item.detalEur * 1.15), currency_code: "usd" },
            ],
          },
          {
            title: "Al por Mayor (Caja / Bulto)",
            sku: `MAYOR-${item.handle.toUpperCase()}`,
            options: {
              Modalidad: "Al por Mayor (Caja / Bulto)",
            },
            prices: [
              { amount: item.mayorEur, currency_code: "eur" },
              { amount: Math.round(item.mayorEur * 1.15), currency_code: "usd" },
            ],
          },
        ],
        sales_channels: [{ id: defaultSalesChannel.id }],
      })),
    },
  })

  logger.info(`Creados ${createdProducts.length} productos de Supermercado (Mayor y Detal).`)

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
          stocked_quantity: 1000,
          inventory_item_id: item.id,
        })),
      },
    })
  }

  logger.info("¡Inventario Mayorista y al Detal listo!")
}
