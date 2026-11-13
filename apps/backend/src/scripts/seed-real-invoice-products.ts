import { ExecArgs } from "@medusajs/framework/types"
import {
  ContainerRegistrationKeys,
  Modules,
  ProductStatus,
} from "@medusajs/framework/utils"
import {
  createInventoryLevelsWorkflow,
  createProductsWorkflow,
  deleteProductsWorkflow,
} from "@medusajs/medusa/core-flows"

const roundCop = (val: number) => Math.max(100, Math.round(val / 100) * 100)

// Fórmula Industrial Grandes Superficies:
// Precio = Costo / (1 - %Margen/100)
const calcIndustrialPrice = (cost: number, marginPct: number, discountPct = 0) => {
  const divisor = (100 - marginPct) / 100
  const discFactor = 1 - discountPct / 100
  return roundCop((cost / divisor) * discFactor)
}

export default async function seedRealInvoiceProducts({ container }: ExecArgs) {
  const logger = container.resolve(ContainerRegistrationKeys.LOGGER)
  const query = container.resolve(ContainerRegistrationKeys.QUERY)

  logger.info("Eliminando productos de plantilla anteriores...")

  const { data: existingProducts } = await query.graph({
    entity: "product",
    fields: ["id"],
  })

  if (existingProducts.length > 0) {
    await deleteProductsWorkflow(container).run({
      input: { ids: existingProducts.map((p: any) => p.id) },
    })
    logger.info(`Eliminados ${existingProducts.length} productos de plantilla.`)
  }

  const { data: categories } = await query.graph({
    entity: "product_category",
    fields: ["id", "name", "handle"],
  })

  const getCatId = (name: string) => {
    const found = categories.find(
      (c: any) =>
        c.name.toLowerCase().includes(name.toLowerCase()) ||
        c.handle.toLowerCase().includes(name.toLowerCase())
    )
    return found ? found.id : categories[0]?.id
  }

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

  // Lista Real de Productos Factura / Excel (Santander & AJE)
  const REAL_INVOICE_PRODUCTS = [
    {
      codeRef: "Santander Pág 4/4 (#39)",
      title: "Desodorante Rexona Women Clinical Classic Tubo 60g",
      handle: "rexona-women-clinical-tubo-60g",
      barcode: "7702010123901",
      categoryName: "Aseo y Hogar",
      categoryKey: "aseo",
      costCop: 16000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Tubo Crema x 60g",
      mayorLabel: "Caja x 12 Tubos",
      description: "Desodorante antitranspirante Rexona Women Clinical Classic en crema tubo 60g. Máxima protección dermatológica contra la sudoración y el mal olor.",
      image: "https://images.unsplash.com/photo-1556228720-195a672e8a03?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "Santander Pág 4/4 (#40)",
      title: "Desodorante Rexona Men Clinical Clean Tubo 60g",
      handle: "rexona-men-clinical-clean-tubo-60g",
      barcode: "7702010123918",
      categoryName: "Aseo y Hogar",
      categoryKey: "aseo",
      costCop: 16000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Tubo Crema x 60g",
      mayorLabel: "Caja x 12 Tubos",
      description: "Desodorante antitranspirante Rexona Men Clinical Clean en tubo crema 60g. 3 veces más protección contra el sudor y fragancia masculina fresca.",
      image: "https://images.unsplash.com/photo-1585751119414-ef2636f8aede?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "Santander Pág 4/4 (#41)",
      title: "Desodorante Rexona Women Clinical Classic Tubo 30g",
      handle: "rexona-women-clinical-tubo-30g",
      barcode: "7702010123925",
      categoryName: "Aseo y Hogar",
      categoryKey: "aseo",
      costCop: 9600,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Tubo Crema x 30g",
      mayorLabel: "Caja x 12 Tubos",
      description: "Presentación práctica para bolso o viaje. Rexona Women Clinical Classic 30g con 96 horas de protección avanzada antitranspirante.",
      image: "https://images.unsplash.com/photo-1571781926291-c477ebfd024b?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "Santander Pág 4/4 (#42)",
      title: "Jabón Puro Hortensias y Flores Blancas Barra 180g",
      handle: "jabon-puro-hortensias-flores-blancas-180g",
      barcode: "7702010123932",
      categoryName: "Aseo y Hogar",
      categoryKey: "aseo",
      costCop: 2400,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 25,
      discountPct: 0,
      detalLabel: "Barra x 180g",
      mayorLabel: "Caja / Fardo x 25 Barras",
      description: "Jabón en barra Puro con delicada fragancia a Hortensias y Flores Blancas. Alto poder de limpieza y cuidado de prendas delicadas.",
      image: "https://images.unsplash.com/photo-1607006314187-578f7e6f3d9d?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 1 (PTE10337)",
      title: "Gaseosa Big Cola 1.75 Litros No Retornable (Paca x 8)",
      handle: "big-cola-1-75l-paca-x8",
      barcode: "7703010103371",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 3200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 8,
      discountPct: 0,
      detalLabel: "Botella x 1.75 Litros",
      mayorLabel: "Paca x 8 Botellas",
      description: "Gaseosa Big Cola tamaño familiar de 1.75L PET no retornable. Sabor refrescante inconfundible al mejor precio de mercado.",
      image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 1 (PTE10337-B)",
      title: "Gaseosa Big Cola 1.75L - Promo Especial Bonificada (Paca x 8)",
      handle: "big-cola-1-75l-promo-bonificada",
      barcode: "7703010103388",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 2700,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 8,
      discountPct: 15,
      detalLabel: "Botella x 1.75 Litros (Promo)",
      mayorLabel: "Paca x 8 Botellas (Bonificada)",
      description: "Edición promocional bonificada de Big Cola 1.75L con precio de fábrica preferencial para clientes mayoristas y tiendas.",
      image: "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10015)",
      title: "Gaseosa Big Sabor Uva 400ml PET (Paca x 12)",
      handle: "big-uva-400ml-paca-x12",
      barcode: "7703010100158",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 1200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Botella Personal x 400ml",
      mayorLabel: "Paca x 12 Botellas",
      description: "Gaseosa Big sabor uva dulce y refrescante en presentación personal de 400ml en botella plástica no retornable.",
      image: "https://images.unsplash.com/photo-1527661591475-527312dd65f5?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10036)",
      title: "Bebida Cifrut Citrus Cítricos 250ml (Paca x 15)",
      handle: "cifrut-citrus-250ml-paca-x15",
      barcode: "7703010100363",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 960,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 15,
      discountPct: 0,
      detalLabel: "Botella x 250ml",
      mayorLabel: "Paca x 15 Botellas",
      description: "Deliciosa bebida refrescante Cifrut sabor a cítricos con vitamina C en práctica botella pet de 250ml para loncheras y tiendas.",
      image: "https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10063)",
      title: "Bebida Cifrut Sabor Mora 250ml (Paca x 15)",
      handle: "cifrut-mora-250ml-paca-x15",
      barcode: "7703010100639",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 960,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 15,
      discountPct: 0,
      detalLabel: "Botella x 250ml",
      mayorLabel: "Paca x 15 Botellas",
      description: "Bebida Cifrut sabor mora silvestre con jugo de fruta natural. Ideal para acompañar comidas y refrigerios.",
      image: "https://images.unsplash.com/photo-1546173159-315724a31696?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10074)",
      title: "Bebida Cifrut Fruit Ponche de Frutas 250ml (Paca x 15)",
      handle: "cifrut-fruit-ponche-250ml-paca-x15",
      barcode: "7703010100745",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 960,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 15,
      discountPct: 0,
      detalLabel: "Botella x 250ml",
      mayorLabel: "Paca x 15 Botellas",
      description: "Cifrut Fruit Punch combinación de frutas tropicales en botella de 250ml. Gran rotación en tiendas y autoservicios.",
      image: "https://images.unsplash.com/photo-1553530666-ba11a7da3888?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10077)",
      title: "Gaseosa Big Sabor Piña Tropical 400ml (Paca x 12)",
      handle: "big-pina-400ml-paca-x12",
      barcode: "7703010100776",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 1200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Botella Personal x 400ml",
      mayorLabel: "Paca x 12 Botellas",
      description: "Bebida gaseosa Big piña tropical con burbujas intensas. Botella personal de 400ml para consumo inmediato.",
      image: "https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10310-B)",
      title: "Agua Pura de Mesa Vida 620ml (Bonificación Paca x 20)",
      handle: "agua-vida-620ml-bonificada",
      barcode: "7703010103104",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 800,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 20,
      discountPct: 15,
      detalLabel: "Botella x 620ml",
      mayorLabel: "Paca x 20 Botellas",
      description: "Agua de mesa pura tratada y purificada Vida de 620ml. Hidratación limpia y saludable a precio bonificado de distribuidor.",
      image: "https://images.unsplash.com/photo-1548839140-29a749e1bc4e?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10351)",
      title: "Gaseosa Big Sabor Manzana 400ml No Retornable (Paca x 12)",
      handle: "big-manzana-400ml-paca-x12",
      barcode: "7703010103517",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 1200,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 0,
      detalLabel: "Botella Personal x 400ml",
      mayorLabel: "Paca x 12 Botellas",
      description: "Gaseosa Big Manzana roja en envase pet de 400ml. Delicioso sabor frutal con gas para toda la familia.",
      image: "https://images.unsplash.com/photo-1576186726580-a816e8b12896?auto=format&fit=crop&w=600&q=80",
    },
    {
      codeRef: "AJE Fact 2 (PTE10351-B)",
      title: "Gaseosa Big Sabor Manzana 400ml - Promo Bonificación x 12",
      handle: "big-manzana-400ml-promo-bonificada",
      barcode: "7703010103524",
      categoryName: "Bebidas y Licores",
      categoryKey: "bebidas",
      costCop: 1000,
      detalMarginPct: 20,
      mayorMarginPct: 15,
      mayorUnits: 12,
      discountPct: 15,
      detalLabel: "Botella Personal x 400ml",
      mayorLabel: "Paca x 12 Botellas (Promo)",
      description: "Lote bonificado de Big Manzana 400ml con descuento especial para mayoristas y ventas por volumen.",
      image: "https://images.unsplash.com/photo-1568909344668-6f14a07b56a0?auto=format&fit=crop&w=600&q=80",
    },
  ]

  logger.info(`Insertando los ${REAL_INVOICE_PRODUCTS.length} productos reales de la factura Santander y AJE...`)

  const productsPayload = REAL_INVOICE_PRODUCTS.map((item) => {
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
        code_ref: item.codeRef,
        barcode: item.barcode,
        detal_label: item.detalLabel,
        mayor_label: item.mayorLabel,
        cost_cop: item.costCop,
        detal_margin_pct: item.detalMarginPct,
        mayor_margin_pct: item.mayorMarginPct,
        mayor_units: item.mayorUnits,
        discount_pct: item.discountPct,
        sede: "Sede Principal",
        stock_qty: 250,
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

  logger.info(`✅ ¡Éxito! Se crearon ${createdProducts.length} productos reales con fórmula industrial y código 770.`)
}

