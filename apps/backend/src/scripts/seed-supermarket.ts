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
  createRegionsWorkflow,
  createShippingOptionsWorkflow,
  createTaxRegionsWorkflow,
  deleteProductCategoriesWorkflow,
  deleteProductsWorkflow,
  updateStoresWorkflow,
} from "@medusajs/medusa/core-flows"

export default async function seedColombiaStore({ container }: ExecArgs) {
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)
  const query = container.resolve(ContainerRegistrationKeys.QUERY)
  const fulfillmentModuleService = container.resolve(Modules.FULFILLMENT)

  logger.info("Configurando tienda para Colombia (COP)...")

  const { data: stores } = await query.graph({
    entity: "store",
    fields: ["id", "supported_currencies.currency_code"],
  })
  const store = stores[0]

  await updateStoresWorkflow(container).run({
    input: {
      selector: { id: store.id },
      update: {
        name: "Súper Express Colombia - Mayor y Detal",
        supported_currencies: [
          { currency_code: "cop", is_default: true },
          { currency_code: "eur", is_default: false },
          { currency_code: "usd", is_default: false },
        ],
      },
    },
  })

  // Check if Colombia region exists
  const { data: existingRegions } = await query.graph({
    entity: "region",
    fields: ["id", "name", "currency_code", "countries.iso_2"],
  })

  let coRegion = existingRegions.find(
    (r: any) =>
      r.currency_code === "cop" ||
      r.countries?.some((c: any) => c.iso_2 === "co")
  )

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

  const { data: salesChannels } = await query.graph({
    entity: "sales_channel",
    fields: ["id"],
  })
  const defaultSalesChannel = salesChannels[0]

  if (!coRegion) {
    logger.info("Creando Región Colombia (COP)...")
    const { result: createdRegions } = await createRegionsWorkflow(
      container
    ).run({
      input: {
        regions: [
          {
            name: "Colombia",
            currency_code: "cop",
            countries: ["co"],
            payment_providers: ["pp_system_default"],
          },
        ],
      },
    })
    coRegion = createdRegions[0]

    try {
      await createTaxRegionsWorkflow(container).run({
        input: [{ country_code: "co", provider_id: "tp_system" }],
      })
    } catch {
      // ignore if already exists
    }

    try {
      const fulfillmentSet =
        await fulfillmentModuleService.createFulfillmentSets({
          name: "Despacho Nacional Colombia",
          type: "shipping",
          service_zones: [
            {
              name: "Colombia",
              geo_zones: [{ country_code: "co", type: "country" }],
            },
          ],
        })

      const link = container.resolve(ContainerRegistrationKeys.LINK)
      await link.create({
        [Modules.STOCK_LOCATION]: {
          stock_location_id: stockLocation.id,
        },
        [Modules.FULFILLMENT]: {
          fulfillment_set_id: fulfillmentSet.id,
        },
      })

      await createShippingOptionsWorkflow(container).run({
        input: [
          {
            name: "Domicilio Express (30-45 min)",
            price_type: "flat",
            provider_id: "manual_manual",
            service_zone_id: fulfillmentSet.service_zones[0].id,
            shipping_profile_id: shippingProfile.id,
            type: {
              label: "Domicilio Express",
              description: "Entrega hoy mismo en tu dirección.",
              code: "express-co",
            },
            prices: [
              { currency_code: "cop", amount: 6000 },
              { region_id: coRegion.id, amount: 6000 },
            ],
            rules: [
              { attribute: "enabled_in_store", value: "true", operator: "eq" },
              { attribute: "is_return", value: "false", operator: "eq" },
            ],
          },
        ],
      })
    } catch (e) {
      logger.warn("Aviso al crear envío CO: " + (e as any)?.message)
    }
  }

  logger.info("Actualizando catálogo con precios en Pesos Colombianos (COP)...")

  const { data: existingProducts } = await query.graph({
    entity: "product",
    fields: ["id"],
  })

  if (existingProducts.length > 0) {
    await deleteProductsWorkflow(container).run({
      input: { ids: existingProducts.map((p: any) => p.id) },
    })
  }

  const { data: existingCats } = await query.graph({
    entity: "product_category",
    fields: ["id"],
  })

  if (existingCats.length > 0) {
    await deleteProductCategoriesWorkflow(container).run({
      input: existingCats.map((c: any) => c.id),
    })
  }

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

  const { data: existingOptions } = await query.graph({
    entity: "product_option",
    fields: ["id", "title"],
  })
  let modOption = existingOptions.find((o: any) => o.title === "Modalidad")
  if (!modOption) {
    const { result: options } = await createProductOptionsWorkflow(
      container
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

  const catalog = [
    // 1. FRUTAS Y VERDURAS
    {
      title: "Aguacate Hass de Antioquia Seleccionado",
      handle: "aguacate-hass-organico",
      category: "Frutas y Verduras",
      description:
        "Aguacates Hass cremosos de exportación cultivados en el Oriente Antioqueño. Lleva por malla familiar o canastilla mayorista de 10kg.",
      image:
        "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80",
      detalCop: 6900,
      mayorCop: 58000,
      detalEur: 4,
      mayorEur: 32,
      detalLabel: "Malla x 1kg",
      mayorLabel: "Canastilla x 10kg (Ahorra 20%)",
    },
    {
      title: "Fresas Sabaneras Extra Dulces",
      handle: "fresas-frescas-500g",
      category: "Frutas y Verduras",
      description:
        "Fresas recién recolectadas de la Sabana de Bogotá, clasificadas y listas para jugo, postres o negocio.",
      image:
        "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80",
      detalCop: 5800,
      mayorCop: 46000,
      detalEur: 3,
      mayorEur: 24,
      detalLabel: "Bandeja x 500g",
      mayorLabel: "Caja x 10 Bandejas (5kg)",
    },
    {
      title: "Banano Urabá Tipo Exportación",
      handle: "banano-organico-exportacion",
      category: "Frutas y Verduras",
      description:
        "Bananos dulces ricos en potasio de Urabá. Disponibles por mano familiar o caja cerrada para tiendas y restaurantes.",
      image:
        "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80",
      detalCop: 3900,
      mayorCop: 34000,
      detalEur: 2,
      mayorEur: 18,
      detalLabel: "Mano x 1kg",
      mayorLabel: "Caja Mayorista x 12kg",
    },

    // 2. DESPENSA Y ABARROTES
    {
      title: "Café de Colombia Origen Huila Tostado",
      handle: "cafe-grano-artesanal",
      category: "Despensa y Abarrotes",
      description:
        "Café 100% Colombiano Excelso de altura con notas a panela y cacao. Disponible por libra o paca mayorista x 12 libras.",
      image:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80",
      detalCop: 22900,
      mayorCop: 215000,
      detalEur: 9,
      mayorEur: 85,
      detalLabel: "Bolsa x 500g (1 Libra)",
      mayorLabel: "Paca x 12 Libras (6kg)",
    },
    {
      title: "Aceite Gourmet Vegetal / Oliva Extra",
      handle: "aceite-oliva-virgen-extra",
      category: "Despensa y Abarrotes",
      description:
        "Aceite puro libre de colesterol para cocina familiar o fritura limpia en restaurantes. Botella o caja cerrada.",
      image:
        "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80",
      detalCop: 28500,
      mayorCop: 142000,
      detalEur: 12,
      mayorEur: 58,
      detalLabel: "Botella x 1000ml",
      mayorLabel: "Caja x 6 Botellas",
    },
    {
      title: "Arroz Blanco del Tolima Grano Entero",
      handle: "arroz-blanco-extra-grano",
      category: "Despensa y Abarrotes",
      description:
        "Arroz colombiano seleccionado que crece y queda suelto. Lleva por kilo o por arroba/paca mayorista de 25 bolsas.",
      image:
        "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80",
      detalCop: 4500,
      mayorCop: 89000,
      detalEur: 2,
      mayorEur: 38,
      detalLabel: "Bolsa x 1kg",
      mayorLabel: "Paca Mayorista x 25kg (2 Arrobas)",
    },
    {
      title: "Pan Artesanal Fresco de Masa Madre",
      handle: "pan-artesanal-masa-madre",
      category: "Despensa y Abarrotes",
      description:
        "Horneado todas las mañanas con fermentación lenta. Corteza dorada y miga suave para desayunos o restaurantes.",
      image:
        "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80",
      detalCop: 9500,
      mayorCop: 76000,
      detalEur: 5,
      mayorEur: 40,
      detalLabel: "Hogaza x 650g",
      mayorLabel: "Canasta x 10 Hogazas",
    },

    // 3. LÁCTEOS Y HUEVOS
    {
      title: "Leche Entera de la Sabana UHT",
      handle: "leche-entera-fresca-1l",
      category: "Lácteos y Huevos",
      description:
        "Leche 100% pura de vaca de hatos certificados en Cundinamarca y Antioquia. Venta por bolsa/caja o paca x 12 litros.",
      image:
        "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80",
      detalCop: 4800,
      mayorCop: 46500,
      detalEur: 2,
      mayorEur: 19,
      detalLabel: "Caja x 1 Litro",
      mayorLabel: "Paca x 12 Litros",
    },
    {
      title: "Huevos Rojos Camperos AA",
      handle: "huevos-camperos-docena",
      category: "Lácteos y Huevos",
      description:
        "Huevos frescos AA de granja avícola colombiana. Llévalos por cubeta de 30 unidades o caja mayorista de 12 cubetas (360 uds).",
      image:
        "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80",
      detalCop: 16900,
      mayorCop: 175000,
      detalEur: 4,
      mayorEur: 72,
      detalLabel: "Cubeta x 30 Unidades AA",
      mayorLabel: "Caja Mayorista x 360 uds (12 Cubetas)",
    },
    {
      title: "Queso Doble Crema / Mozzarella Tajado",
      handle: "queso-mozzarella-fresco",
      category: "Lácteos y Huevos",
      description:
        "Queso fresco colombiano de hilado suave que estira perfecto en arepas, sanduches, pizzas y panadería.",
      image:
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80",
      detalCop: 14500,
      mayorCop: 118000,
      detalEur: 6,
      mayorEur: 48,
      detalLabel: "Bloque x 500g",
      mayorLabel: "Barra Mayorista x 2.5kg (x2 barras)",
    },

    // 4. CARNES Y CHARCUTERÍA
    {
      title: "Churrasco / Lomo de Res Madurado",
      handle: "lomo-res-madurado",
      category: "Carnes y Charcutería",
      description:
        "Corte premium de ganado seleccionado en los Llanos y Córdoba, empacado al vacío con cadena de frío garantizada.",
      image:
        "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80",
      detalCop: 26900,
      mayorCop: 218000,
      detalEur: 14,
      mayorEur: 110,
      detalLabel: "Bandeja x 500g",
      mayorLabel: "Pieza Entera al Vacío x 5kg",
    },
    {
      title: "Pechuga de Pollo Campesino Sin Hueso",
      handle: "pechuga-pollo-fresca",
      category: "Carnes y Charcutería",
      description:
        "Filetes de pechuga fresca limpia sin marinado artificial. Ideal para el mercado semanal o asaderos y restaurantes.",
      image:
        "https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80",
      detalCop: 16500,
      mayorCop: 135000,
      detalEur: 7,
      mayorEur: 55,
      detalLabel: "Bandeja x 1kg",
      mayorLabel: "Canastilla Mayorista x 10kg",
    },

    // 5. BEBIDAS Y LICORES
    {
      title: "Jugo de Naranja Tangelo 100% Natural",
      handle: "jugo-naranja-exprimido",
      category: "Bebidas y Licores",
      description:
        "Exprimido de naranjas frescas del Eje Cafetero sin azúcar añadida ni conservantes.",
      image:
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80",
      detalCop: 8900,
      mayorCop: 84000,
      detalEur: 3,
      mayorEur: 28,
      detalLabel: "Botella x 1L",
      mayorLabel: "Caja x 12 Botellas",
    },
    {
      title: "Agua Manantial de Páramo Sin Gas",
      handle: "agua-mineral-manantial",
      category: "Bebidas y Licores",
      description:
        "Agua cristalina de manantial colombiano en botella individual o paca termoencogida para tiendas y eventos.",
      image:
        "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80",
      detalCop: 2800,
      mayorCop: 38000,
      detalEur: 1,
      mayorEur: 16,
      detalLabel: "Botella x 1.5L",
      mayorLabel: "Paca Mayorista x 24 uds",
    },

    // 6. ASEO Y HOGAR
    {
      title: "Detergente Líquido Concentrado Multiusos",
      handle: "detergente-liquido-ecologico",
      category: "Aseo y Hogar",
      description:
        "Máximo poder desmanchador y fragancia fresca duradera. Disponible en galón para hogar o pimpina institucional.",
      image:
        "https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80",
      detalCop: 21900,
      mayorCop: 119000,
      detalEur: 8,
      mayorEur: 58,
      detalLabel: "Galón x 3 Litros",
      mayorLabel: "Pimpina Mayorista x 20L",
    },
    {
      title: "Papel Higiénico Triple Hoja Rinde Más",
      handle: "papel-higienico-triple-hoja",
      category: "Aseo y Hogar",
      description:
        "Suavidad acolchada con extracto de algodón y metraje extra. Paquete familiar o paca distribuidora.",
      image:
        "https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80",
      detalCop: 18900,
      mayorCop: 128000,
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
              { amount: item.detalCop, currency_code: "cop" },
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
              { amount: item.mayorCop, currency_code: "cop" },
              { amount: item.mayorEur, currency_code: "eur" },
              { amount: Math.round(item.mayorEur * 1.15), currency_code: "usd" },
            ],
          },
        ],
        sales_channels: [{ id: defaultSalesChannel.id }],
      })),
    },
  })

  logger.info(`Creados ${createdProducts.length} productos con precios en COP.`)

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

  logger.info("¡Tienda Súper Express Colombia (COP) 100% configurada!")
}
