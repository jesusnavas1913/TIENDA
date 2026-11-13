import { ExecArgs } from "@medusajs/framework/types"
import {
  ContainerRegistrationKeys,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createProductsWorkflow,
} from "@medusajs/medusa/core-flows"

const roundCop = (val: number) => Math.max(100, Math.round(val / 100) * 100)

// Fórmula Industrial Grandes Superficies:
// Precio = Costo / (1 - %Margen/100)
const calcIndustrialPrice = (cost: number, marginPct: number, discountPct = 0) => {
  const divisor = (100 - marginPct) / 100
  const discFactor = 1 - discountPct / 100
  return roundCop((cost / divisor) * discFactor)
}

export default async function seedCompleteSupermarket({ container }: ExecArgs) {
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)
  const query = container.resolve(ContainerRegistrationKeys.QUERY)

  logger.info("Verificando catálogo y completando todos los departamentos del supermercado...")

  const { data: existingProducts } = await query.graph({
    entity: "product",
    fields: ["id", "title", "handle"],
  })

  const existingTitles = new Set(existingProducts.map((p: any) => p.title.toLowerCase().trim()))

  const { data: categories } = await query.graph({
    entity: "product_category",
    fields: ["id", "name", "handle"],
  })

  const getCatId = (key: string) => {
    const found = categories.find(
      (c: any) =>
        c.name.toLowerCase().includes(key.toLowerCase()) ||
        c.handle.toLowerCase().includes(key.toLowerCase())
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

  // CATÁLOGO COMPLETO DE SUPERMERCADO COLOMBIANO
  const SUPERMARKET_CATALOG = [
    // 1. FRUTAS Y VERDURAS / FRESCOS
    {
      title: "Papa Pastusa Seleccionada Limpia",
      handle: "papa-pastusa-seleccionada",
      barcode: "7701010100012",
      categoryKey: "frutas-y-verduras",
      categoryName: "Frutas y Verduras",
      costCop: 2200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25, // Bulto x 25kg
      discountPct: 0,
      detalLabel: "Kilo Seleccionado (1 kg)",
      mayorLabel: "Bulto x 25 Kilos",
      description: "Papa pastusa fresca de primera calidad, ideal para sopas, puré y fritos. Cultivada en el altiplano cundiboyacense.",
      image: "https://images.unsplash.com/photo-1518977676601-b53f82aba655?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Tomate Chonto Maduro de Primera",
      handle: "tomate-chonto-maduro",
      barcode: "7701010100029",
      categoryKey: "frutas-y-verduras",
      categoryName: "Frutas y Verduras",
      costCop: 2800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 20, // Canastilla x 20kg
      discountPct: 0,
      detalLabel: "Kilo Fresco (1 kg)",
      mayorLabel: "Canastilla x 20 Kilos",
      description: "Tomate chonto firme y jugoso con punto óptimo de maduración para guisos, ensaladas y consumo diario.",
      image: "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Cebolla Cabezona Blanca Seleccionada",
      handle: "cebolla-cabezona-blanca",
      barcode: "7701010100036",
      categoryKey: "frutas-y-verduras",
      categoryName: "Frutas y Verduras",
      costCop: 2400,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25, // Bulto x 25kg
      discountPct: 0,
      detalLabel: "Kilo Seleccionado (1 kg)",
      mayorLabel: "Bulto x 25 Kilos",
      description: "Cebolla cabezona de gran calibre, fresca y crujiente para sazonar todas tus preparaciones culinarias.",
      image: "https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Plátano Verde Hartón Guineo",
      handle: "platano-verde-harton",
      barcode: "7701010100043",
      categoryKey: "frutas-y-verduras",
      categoryName: "Frutas y Verduras",
      costCop: 2500,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 20, // Racimo/Caja x 20kg
      discountPct: 0,
      detalLabel: "Kilo de Plátano (1 kg)",
      mayorLabel: "Caja Mayorista x 20 Kilos",
      description: "Plátano hartón verde recién cosechado del Eje Cafetero, perfecto para patacones crocantes y sopas tradicionales.",
      image: "https://images.unsplash.com/photo-1603833665858-e61d17a86224?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Aguacate Hass Extra Calidad Exportación",
      handle: "aguacate-hass-extra",
      barcode: "7701010100050",
      categoryKey: "frutas-y-verduras",
      categoryName: "Frutas y Verduras",
      costCop: 4800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10, // Malla/Caja x 10kg
      discountPct: 0,
      detalLabel: "Kilo de Aguacate Hass (1 kg)",
      mayorLabel: "Caja Mayorista x 10 Kilos",
      description: "Aguacate Hass cremoso, con excelente contenido graso natural y textura mantecosa lista para consumo.",
      image: "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=600&q=80",
    },

    // 2. CARNES Y CHARCUTERÍA
    {
      title: "Pechuga de Pollo Fresca Campesina",
      handle: "pechuga-pollo-fresca-campesina",
      barcode: "7701010100067",
      categoryKey: "carnes-y-charcuteria",
      categoryName: "Carnes y Charcutería",
      costCop: 12000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10, // Caja x 10kg
      discountPct: 0,
      detalLabel: "Kilo de Pechuga (1 kg)",
      mayorLabel: "Caja x 10 Kilos Refrigerada",
      description: "Pechuga de pollo fresca sin inyección, tierna y jugosa con corte impecable para asar, desmechar o freír.",
      image: "https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Carne de Res Molida Especial Magra",
      handle: "carne-res-molida-especial",
      barcode: "7701010100074",
      categoryKey: "carnes-y-charcuteria",
      categoryName: "Carnes y Charcutería",
      costCop: 14000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10, // Empaque x 10kg
      discountPct: 0,
      detalLabel: "Kilo Molida Magra (1 kg)",
      mayorLabel: "Lote Mayorista x 10 Kilos",
      description: "Carne de res 90% magra molida en el día, baja en grasa, ideal para albóndigas, lasañas y hamburguesas artesanales.",
      image: "https://images.unsplash.com/photo-1588168333986-5078d3ae3976?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Lomo de Cerdo Fresco en Filetes",
      handle: "lomo-cerdo-fresco",
      barcode: "7701010100081",
      categoryKey: "carnes-y-charcuteria",
      categoryName: "Carnes y Charcutería",
      costCop: 13500,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10,
      discountPct: 0,
      detalLabel: "Kilo de Lomo (1 kg)",
      mayorLabel: "Caja Frigorífica x 10 Kilos",
      description: "Corte suave y magro de cerdo de granja tecnificada, libre de hormonas, listo para asar o empanizar.",
      image: "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Costilla de Res Especial para Sancocho",
      handle: "costilla-res-sancocho",
      barcode: "7701010100098",
      categoryKey: "carnes-y-charcuteria",
      categoryName: "Carnes y Charcutería",
      costCop: 11000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10,
      discountPct: 0,
      detalLabel: "Kilo de Costilla (1 kg)",
      mayorLabel: "Lote Mayorista x 10 Kilos",
      description: "Costilla de res con excelente proporción de carne y hueso para caldos con sabor profundo y tradicional.",
      image: "https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=600&q=80",
    },

    // 3. DESPENSA, ARROCES, GRANOS Y VÍVERES
    {
      title: "Arroz Diana Blanco Seleccionado Grano Entero",
      handle: "arroz-diana-blanco-1kg",
      barcode: "7701010100104",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 3800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25, // Bulto x 25kg
      discountPct: 0,
      detalLabel: "Bolsa x 1 Kilo",
      mayorLabel: "Bulto Arrocero x 25 Kilos",
      description: "El arroz preferido de los hogares colombianos. Grano largo, blanco y suelto garantizado en cada preparación.",
      image: "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Arroz Roa Flor Huila Superior",
      handle: "arroz-roa-flor-huila",
      barcode: "7701010100111",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 4000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25, // Bulto x 25kg
      discountPct: 0,
      detalLabel: "Bolsa x 1 Kilo",
      mayorLabel: "Bulto Mayorista x 25 Kilos",
      description: "Arroz Roa del Huila, rendimiento superior y textura perfecta para acompañar todas tus comidas.",
      image: "https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Frijol Bola Roja Nacional Seleccionado",
      handle: "frijol-bola-roja-nacional",
      barcode: "7701010100128",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 4500,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 24, // Paca x 24 bolsas de 500g
      discountPct: 0,
      detalLabel: "Bolsa x 500g",
      mayorLabel: "Paca x 24 Bolsas (12 kg)",
      description: "Frijol bola roja de cosecha reciente, caldo espeso y rápida cocción para la tradicional bandeja paisa.",
      image: "https://images.unsplash.com/photo-1551462147-ff29053bfc14?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Lenteja Pardina Especial Grano Suave",
      handle: "lenteja-pardina-especial",
      barcode: "7701010100135",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 2800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 24, // Paca x 24 bolsas de 500g
      discountPct: 0,
      detalLabel: "Bolsa x 500g",
      mayorLabel: "Paca x 24 Bolsas (12 kg)",
      description: "Lentejas ricas en hierro y proteína vegetal, de grano uniforme y sabor suave para la despensa del hogar.",
      image: "https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Aceite Vegetal Diana / Premier Puro",
      handle: "aceite-vegetal-puro-1000ml",
      barcode: "7701010100142",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 7800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12, // Caja x 12 botellas
      discountPct: 0,
      detalLabel: "Botella x 1000ml",
      mayorLabel: "Caja x 12 Botellas (12 Litros)",
      description: "Aceite vegetal 100% puro libre de colesterol, enriquecido con vitaminas A y D para frituras crocantes y livianas.",
      image: "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Azúcar Blanca Refinada Manuelita",
      handle: "azucar-blanca-manuelita-1kg",
      barcode: "7701010100159",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 3600,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25, // Bulto x 25kg
      discountPct: 0,
      detalLabel: "Bolsa x 1 Kilo",
      mayorLabel: "Bulto x 25 Kilos",
      description: "Azúcar blanca refinada de caña de azúcar del Valle del Cauca, pureza y dulzura natural para postres y bebidas.",
      image: "https://images.unsplash.com/photo-1581441363689-1f3c3c414635?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Café Tostado y Molido Sello Rojo",
      handle: "cafe-molido-sello-rojo-500g",
      barcode: "7701010100166",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 11500,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12, // Paca x 12
      discountPct: 0,
      detalLabel: "Bolsa x 500g",
      mayorLabel: "Paca x 12 Bolsas (6 kg)",
      description: "Café colombiano tradicional con aroma intenso y cuerpo balanceado, el despertar de todas las mañanas.",
      image: "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Chocolate Corona Tradicional en Pastillas",
      handle: "chocolate-corona-tradicional-500g",
      barcode: "7701010100173",
      categoryKey: "despensa-y-abarrotes",
      categoryName: "Despensa y Abarrotes",
      costCop: 6200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12, // Paca x 12
      discountPct: 0,
      detalLabel: "Pastilla x 500g",
      mayorLabel: "Paca x 12 Pastillas (6 kg)",
      description: "Chocolate de mesa colombiano espumoso y aromático para preparar en chocolotera y disfrutar en familia.",
      image: "https://images.unsplash.com/photo-1549007994-cb92caebd54b?auto=format&fit=crop&w=600&q=80",
    },

    // 4. LÁCTEOS, HUEVOS Y REFRIGERADOS
    {
      title: "Huevos Frescos Santa Anita Tipo AA",
      handle: "huevos-santa-anita-tipo-aa",
      barcode: "7701010100180",
      categoryKey: "lacteos-y-huevos",
      categoryName: "Lácteos y Huevos",
      costCop: 14000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12, // Caja x 12 cubetas (360 huevos)
      discountPct: 0,
      detalLabel: "Canasta / Cubeta x 30 Huevos",
      mayorLabel: "Caja Mayorista x 12 Cubetas (360 uds)",
      description: "Huevos frescos de granja tecnificada seleccionados por tamaño y frescura garantizada. Fuente natural de proteína.",
      image: "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Leche Entera Larga Vida Alquería / Colanta",
      handle: "leche-entera-larga-vida-paca",
      barcode: "7701010100197",
      categoryKey: "lacteos-y-huevos",
      categoryName: "Lácteos y Huevos",
      costCop: 3200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 6, // Paca x 6 bolsas
      discountPct: 0,
      detalLabel: "Bolsa x 900ml",
      mayorLabel: "Paca x 6 Bolsas (5.4 Litros)",
      description: "Leche 100% pura de vaca pasteurizada y ultrapasteurizada, enriquecida con calcio y vitaminas para el crecimiento.",
      image: "https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Queso Campesino Fresco del Huila",
      handle: "queso-campesino-fresco-500g",
      barcode: "7701010100203",
      categoryKey: "lacteos-y-huevos",
      categoryName: "Lácteos y Huevos",
      costCop: 8500,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 10, // Bloque x 10 unidades
      discountPct: 0,
      detalLabel: "Bloque x 500g",
      mayorLabel: "Lote Mayorista x 10 Bloques (5 kg)",
      description: "Queso campesino fresco, bajo en sal, textura suave ideal para arepas calientes, desayunos y meriendas.",
      image: "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=600&q=80",
    },

    // 5. ASEO Y HOGAR ADICIONALES (Complementando los 4 de Santander)
    {
      title: "Detergente en Polvo Ariel Doble Poder",
      handle: "detergente-polvo-ariel-1kg",
      barcode: "7701010100210",
      categoryKey: "aseo-y-hogar",
      categoryName: "Aseo y Hogar",
      costCop: 9200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 8, // Paca x 8 bolsas
      discountPct: 0,
      detalLabel: "Bolsa x 1000g",
      mayorLabel: "Paca Mayorista x 8 Bolsas",
      description: "Detergente en polvo con tecnología antimanchas y fragancia duradera. Rinde más lavadas y cuida los colores.",
      image: "https://images.unsplash.com/photo-1610557892470-55d9e80c0bce?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Blanqueador Desinfectante Clorox Triple Acción",
      handle: "blanqueador-clorox-1000ml",
      barcode: "7701010100227",
      categoryKey: "aseo-y-hogar",
      categoryName: "Aseo y Hogar",
      costCop: 3800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12, // Caja x 12
      discountPct: 0,
      detalLabel: "Botella x 1000ml",
      mayorLabel: "Caja x 12 Botellas (12 Litros)",
      description: "Elimina el 99.9% de bacterias, blanquea prendas blancas y desinfecta superficies de baños y cocinas.",
      image: "https://images.unsplash.com/photo-1584813470613-5b1c1cad3d69?auto=format&fit=crop&w=600&q=80",
    },

    // 6. BEBIDAS Y LICORES ADICIONALES (Complementando los 10 de AJE)
    {
      title: "Cerveza Águila Original Colombiana",
      handle: "cerveza-aguila-original-sixpack",
      barcode: "7701010100234",
      categoryKey: "bebidas-y-licores",
      categoryName: "Bebidas y Licores",
      costCop: 2400,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 24, // Paca x 24 latas
      discountPct: 0,
      detalLabel: "Lata x 330ml",
      mayorLabel: "Paca x 24 Latas (Cerveza Mayorista)",
      description: "La cerveza más tradicional de Colombia. Refrescante, ligera y dorada, ideal para compartir reuniones y festejos.",
      image: "https://images.unsplash.com/photo-1608270546103-9c86e2467d02?auto=format&fit=crop&w=600&q=80",
    },
    {
      title: "Gaseosa Postobón Manzana Mega 3.125 Litros",
      handle: "gaseosa-postobon-manzana-mega",
      barcode: "7701010100241",
      categoryKey: "bebidas-y-licores",
      categoryName: "Bebidas y Licores",
      costCop: 5200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 6, // Paca x 6
      discountPct: 0,
      detalLabel: "Botella Mega 3.125L",
      mayorLabel: "Paca x 6 Botellas Mega",
      description: "La clásica gaseosa Manzana Postobón en presentación familiar gigante para almuerzos y eventos.",
      image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?auto=format&fit=crop&w=600&q=80",
    }
  ]

  const itemsToCreate = SUPERMARKET_CATALOG.filter(
    (item) => !existingTitles.has(item.title.toLowerCase().trim())
  )

  logger.info(`Se agregarán ${itemsToCreate.length} nuevos productos para completar todos los pasillos...`)

  if (itemsToCreate.length === 0) {
    logger.info("Todos los departamentos ya tienen productos.")
    return
  }

  const productsPayload = itemsToCreate.map((item) => {
    const detalPrice = calcIndustrialPrice(item.costCop, item.detalMarginPct, item.discountPct)
    const mayorPrice = calcIndustrialPrice(item.costCop * item.mayorUnits, item.mayorMarginPct, item.discountPct)

    return {
      title: item.title,
      handle: item.handle,
      description: item.description,
      status: ProductStatus.PUBLISHED,
      shipping_profile_id: shippingProfile?.id,
      category_ids: [getCatId(item.categoryKey)],
      thumbnail: item.image,
      images: [{ url: item.image }],
      metadata: {
        code_ref: `REF-${item.barcode.slice(-5)}`,
        barcode: item.barcode,
        detal_label: item.detalLabel,
        mayor_label: item.mayorLabel,
        cost_cop: item.costCop,
        detal_margin_pct: item.detalMarginPct,
        mayor_margin_pct: item.mayorMarginPct,
        mayor_units: item.mayorUnits,
        discount_pct: item.discountPct,
        sede: "Sede Principal",
        stock_qty: 300,
        pasillo: item.categoryName,
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
          sku: `DETAL-${item.barcode}`,
          barcode: item.barcode,
          manage_inventory: false,
          allow_backorder: true,
          options: {
            Modalidad: "Al Detal (Unidad)",
          },
          prices: [
            { amount: detalPrice, currency_code: "cop" },
            { amount: Math.max(1, Math.round(detalPrice / 4200)), currency_code: "eur" },
            { amount: Math.max(1, Math.round(detalPrice / 3900)), currency_code: "usd" },
          ],
        },
        {
          title: "Al por Mayor (Caja / Bulto)",
          sku: `MAYOR-${item.barcode}`,
          barcode: `${item.barcode}-M`,
          manage_inventory: false,
          allow_backorder: true,
          options: {
            Modalidad: "Al por Mayor (Caja / Bulto)",
          },
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

  const { result: createdProducts } = await createProductsWorkflow(container).run({
    input: {
      products: productsPayload,
    },
  })

  logger.info(`✅ ¡Éxito! Se añadieron ${createdProducts.length} productos completando Verduras, Carnes, Arroces, Víveres, Lácteos, Aseo y Bebidas.`)
}

