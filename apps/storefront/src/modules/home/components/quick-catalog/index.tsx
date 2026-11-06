"use client"

import { addToCart } from "@lib/data/cart"
import { notifyCartUpdated } from "@lib/util/cart-events"
import { HttpTypes } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import Thumbnail from "@modules/products/components/thumbnail"
import { useParams } from "next/navigation"
import { useMemo, useState } from "react"

type SortMode = "featured" | "price-asc" | "price-desc" | "name-asc"
type SaleMode = "detal" | "mayor"
type ViewLayout = "aisles" | "grid"

const CATEGORY_STYLES: Record<
  string,
  { emoji: string; subtitle: string; color: string; badgeBg: string }
> = {
  "Frutas y Verduras": {
    emoji: "🥑",
    subtitle: "Cosecha fresca del día • Venta por malla o canastilla mayorista",
    color: "from-emerald-600 to-teal-700",
    badgeBg: "bg-emerald-50 text-emerald-800 border-emerald-200",
  },
  "Despensa y Abarrotes": {
    emoji: "🌾",
    subtitle: "Granos, aceites, café y panadería • Unidades o pacas de ahorro",
    color: "from-amber-600 to-orange-700",
    badgeBg: "bg-amber-50 text-amber-800 border-amber-200",
  },
  "Lácteos y Huevos": {
    emoji: "🥛",
    subtitle: "Granjas certificadas y refrigeración continua • Docenas o cajas",
    color: "from-sky-600 to-blue-700",
    badgeBg: "bg-sky-50 text-sky-800 border-sky-200",
  },
  "Carnes y Charcutería": {
    emoji: "🥩",
    subtitle: "Cortes seleccionados madurados al vacío • Bandejas o piezas enteras",
    color: "from-rose-600 to-red-800",
    badgeBg: "bg-rose-50 text-rose-800 border-rose-200",
  },
  "Bebidas y Licores": {
    emoji: "🧃",
    subtitle: "Jugos naturales exprimidos y aguas • Botellas o cajas x12/x24",
    color: "from-purple-600 to-indigo-800",
    badgeBg: "bg-purple-50 text-purple-800 border-purple-200",
  },
  "Aseo y Hogar": {
    emoji: "🧼",
    subtitle: "Limpieza ecológica y cuidado familiar • Galones o fardos institucionales",
    color: "from-teal-600 to-cyan-800",
    badgeBg: "bg-teal-50 text-teal-800 border-teal-200",
  },
}

const PRODUCT_SPECS: Record<
  string,
  {
    detalFormat: string
    mayorFormat: string
    savingPct: string
    rating: string
    reviews: number
    origin: string
  }
> = {
  "aguacate-hass-organico": {
    detalFormat: "Malla x 500g",
    mayorFormat: "Canastilla x 10kg",
    savingPct: "Ahorra 20%",
    rating: "4.9",
    reviews: 148,
    origin: "Cosecha Orgánica de Exportación",
  },
  "fresas-frescas-500g": {
    detalFormat: "Bandeja x 500g",
    mayorFormat: "Caja x 10 Bandejas (5kg)",
    savingPct: "Ahorra 20%",
    rating: "4.8",
    reviews: 94,
    origin: "Cultivo Hidropónico Seleccionado",
  },
  "banano-organico-exportacion": {
    detalFormat: "Mano Familiar x 1kg",
    mayorFormat: "Caja Mayorista x 12kg",
    savingPct: "Ahorra 25%",
    rating: "4.9",
    reviews: 112,
    origin: "Finca Certificada Rainforest",
  },
  "cafe-grano-artesanal": {
    detalFormat: "Bolsa Válvula x 500g",
    mayorFormat: "Paca x 12 Bolsas (6kg)",
    savingPct: "Ahorra 22%",
    rating: "5.0",
    reviews: 215,
    origin: "100% Arábica de Altura 1.800m",
  },
  "aceite-oliva-virgen-extra": {
    detalFormat: "Botella Vidrio x 750ml",
    mayorFormat: "Caja x 6 Botellas",
    savingPct: "Ahorra 20%",
    rating: "4.9",
    reviews: 87,
    origin: "Primera Extracción en Frío",
  },
  "arroz-blanco-extra-grano": {
    detalFormat: "Bolsa x 1kg",
    mayorFormat: "Bulto / Paca x 25kg",
    savingPct: "Ahorra 24%",
    rating: "4.8",
    reviews: 176,
    origin: "Molino Seleccionado Grano Entero",
  },
  "pan-artesanal-masa-madre": {
    detalFormat: "Hogaza Fresca x 650g",
    mayorFormat: "Lote Restaurante x 10 uds",
    savingPct: "Ahorra 20%",
    rating: "4.9",
    reviews: 129,
    origin: "Horneado Diario Fermentación 24h",
  },
  "leche-entera-fresca-1l": {
    detalFormat: "Caja Tetra Pak x 1L",
    mayorFormat: "Paca Cerrada x 12 Litros",
    savingPct: "Ahorra 21%",
    rating: "4.8",
    reviews: 162,
    origin: "Hato Lechero Libre Pastoreo",
  },
  "huevos-camperos-docena": {
    detalFormat: "Cubeta x 12 Unidades AA",
    mayorFormat: "Caja Mayorista x 360 uds",
    savingPct: "Ahorra 25%",
    rating: "4.9",
    reviews: 190,
    origin: "Gallinas Libres de Jaula",
  },
  "queso-mozzarella-fresco": {
    detalFormat: "Bloque Familiar x 500g",
    mayorFormat: "Barra Pizzería x 5kg",
    savingPct: "Ahorra 20%",
    rating: "4.9",
    reviews: 104,
    origin: "Lácteos Artesanales del Valle",
  },
  "lomo-res-madurado": {
    detalFormat: "Bandeja Porcionada x 500g",
    mayorFormat: "Pieza Entera Vacío x 5kg",
    savingPct: "Ahorra 22%",
    rating: "5.0",
    reviews: 98,
    origin: "Ganadería Seleccionada Maduración 21d",
  },
  "pechuga-pollo-fresca": {
    detalFormat: "Bandeja Filetes x 1kg",
    mayorFormat: "Caja Institucional x 10kg",
    savingPct: "Ahorra 21%",
    rating: "4.8",
    reviews: 141,
    origin: "Avícola Fresca Sin Marinado",
  },
  "jugo-naranja-exprimido": {
    detalFormat: "Botella Refrigerada x 1L",
    mayorFormat: "Caja x 12 Botellas",
    savingPct: "Ahorra 22%",
    rating: "4.7",
    reviews: 73,
    origin: "100% Naranjas Valencia Recién Exprimidas",
  },
  "agua-mineral-manantial": {
    detalFormat: "Botella x 1.5 Litros",
    mayorFormat: "Paca Mayorista x 24 uds",
    savingPct: "Ahorra 33%",
    rating: "4.9",
    reviews: 88,
    origin: "Manantial Natural de Montaña",
  },
  "detergente-liquido-ecologico": {
    detalFormat: "Galón Hogar x 3 Litros",
    mayorFormat: "Bidón Mayorista x 20 Litros",
    savingPct: "Ahorra 28%",
    rating: "4.9",
    reviews: 115,
    origin: "Fórmula Biodegradable Hipoalergénica",
  },
  "papel-higienico-triple-hoja": {
    detalFormat: "Paquete Familiar x 12 Rollos",
    mayorFormat: "Fardo Mayorista x 96 Rollos",
    savingPct: "Ahorra 25%",
    rating: "4.8",
    reviews: 154,
    origin: "Ultra Suave Extracto de Algodón",
  },
}

const getSpecs = (product: HttpTypes.StoreProduct) => {
  if (product.handle && PRODUCT_SPECS[product.handle]) {
    return PRODUCT_SPECS[product.handle]
  }
  const meta = (product.metadata || {}) as Record<string, string>
  return {
    detalFormat: meta.detal_label || "1 Unidad Estándar",
    mayorFormat: meta.mayor_label || "Caja Mayorista x 12 uds",
    savingPct: "Ahorra 20%",
    rating: "4.9",
    reviews: 85,
    origin: "Calidad Certificada Súper Express",
  }
}

export default function QuickSupermarketCatalog({
  products,
}: {
  products: HttpTypes.StoreProduct[]
}) {
  const [globalSaleMode, setGlobalSaleMode] = useState<SaleMode>("detal")
  const [cardSaleModes, setCardSaleModes] = useState<Record<string, SaleMode>>({})
  const [viewLayout, setViewLayout] = useState<ViewLayout>("aisles")
  const [selectedCategory, setSelectedCategory] = useState<string>("all")
  const [searchQuery, setSearchQuery] = useState<string>("")
  const [sortBy, setSortBy] = useState<SortMode>("featured")
  const [addingId, setAddingId] = useState<string | null>(null)
  const [addedId, setAddedId] = useState<string | null>(null)
  const [quantities, setQuantities] = useState<Record<string, number>>({})
  const [quickViewProduct, setQuickViewProduct] =
    useState<HttpTypes.StoreProduct | null>(null)

  const countryCode = (useParams()?.countryCode as string) || "dk"

  const getProductMode = (productId: string): SaleMode =>
    cardSaleModes[productId] ?? globalSaleMode

  const setProductMode = (productId: string, mode: SaleMode) => {
    setCardSaleModes((prev) => ({ ...prev, [productId]: mode }))
  }

  const handleGlobalModeSwitch = (mode: SaleMode) => {
    setGlobalSaleMode(mode)
    setCardSaleModes({})
  }

  const getSelectedVariant = (
    product: HttpTypes.StoreProduct,
    mode: SaleMode
  ) => {
    const variants = product.variants || []
    if (variants.length === 0) return undefined
    if (mode === "mayor") {
      return (
        variants.find(
          (v) =>
            v.title?.toLowerCase().includes("mayor") ||
            v.sku?.toUpperCase().startsWith("MAYOR")
        ) ||
        variants[1] ||
        variants[0]
      )
    }
    return (
      variants.find(
        (v) =>
          v.title?.toLowerCase().includes("detal") ||
          v.sku?.toUpperCase().startsWith("DETAL")
      ) || variants[0]
    )
  }

  const getVariantPrice = (
    product: HttpTypes.StoreProduct,
    mode: SaleMode
  ): { amount: number; currency: string } => {
    const v = getSelectedVariant(product, mode) as any
    const calc = v?.calculated_price
    if (calc?.calculated_amount != null) {
      return {
        amount: calc.calculated_amount,
        currency: calc.currency_code || "COP",
      }
    }
    return { amount: mode === "mayor" ? 85000 : 8500, currency: "COP" }
  }

  const formatCurrency = (amount: number, currency = "COP") => {
    const isCOP = currency.toUpperCase() === "COP"
    return new Intl.NumberFormat(isCOP ? "es-CO" : "es-ES", {
      style: "currency",
      currency: currency.toUpperCase(),
      minimumFractionDigits: isCOP ? 0 : 2,
      maximumFractionDigits: isCOP ? 0 : 2,
    }).format(amount)
  }

  const categories = useMemo(() => {
    const map = new Map<string, { id: string; name: string; count: number }>()
    products.forEach((p) => {
      p.categories?.forEach((c) => {
        if (c.id && c.name) {
          const prev = map.get(c.name)
          map.set(c.name, {
            id: c.id,
            name: c.name,
            count: (prev?.count || 0) + 1,
          })
        }
      })
    })
    return Array.from(map.values())
  }, [products])

  const filteredProducts = useMemo(() => {
    const list = products.filter((p) => {
      const matchesCat =
        selectedCategory === "all" ||
        p.categories?.some(
          (c) => c.id === selectedCategory || c.name === selectedCategory
        )
      const matchesSearch =
        !searchQuery.trim() ||
        p.title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
        p.description?.toLowerCase().includes(searchQuery.toLowerCase()) ||
        p.categories?.some((c) =>
          c.name?.toLowerCase().includes(searchQuery.toLowerCase())
        )
      return matchesCat && matchesSearch
    })

    return [...list].sort((a, b) => {
      const modeA = getProductMode(a.id)
      const modeB = getProductMode(b.id)
      if (sortBy === "price-asc")
        return getVariantPrice(a, modeA).amount - getVariantPrice(b, modeB).amount
      if (sortBy === "price-desc")
        return getVariantPrice(b, modeB).amount - getVariantPrice(a, modeA).amount
      if (sortBy === "name-asc")
        return (a.title || "").localeCompare(b.title || "")
      return 0
    })
  }, [products, selectedCategory, searchQuery, sortBy, globalSaleMode, cardSaleModes])

  const groupedByCategory = useMemo(() => {
    const groups: {
      categoryName: string
      categoryId: string
      items: HttpTypes.StoreProduct[]
    }[] = []

    const map = new Map<
      string,
      { categoryId: string; items: HttpTypes.StoreProduct[] }
    >()

    filteredProducts.forEach((p) => {
      const cat = p.categories?.[0]
      const catName = cat?.name || "Otros Productos"
      const catId = cat?.id || "other"
      if (!map.has(catName)) {
        map.set(catName, { categoryId: catId, items: [] })
      }
      map.get(catName)!.items.push(p)
    })

    map.forEach((val, key) => {
      groups.push({
        categoryName: key,
        categoryId: val.categoryId,
        items: val.items,
      })
    })

    return groups
  }, [filteredProducts])

  const getQty = (productId: string) => quantities[productId] || 1

  const changeQty = (productId: string, delta: number) => {
    setQuantities((prev) => {
      const next = Math.max(1, (prev[productId] || 1) + delta)
      return { ...prev, [productId]: next }
    })
  }

  const handleQuickAdd = async (product: HttpTypes.StoreProduct) => {
    const mode = getProductMode(product.id)
    const variant = getSelectedVariant(product, mode)
    if (!variant?.id) return

    setAddingId(product.id)
    try {
      await addToCart({
        variantId: variant.id,
        quantity: getQty(product.id),
        countryCode,
      })
      notifyCartUpdated()
      setAddedId(product.id)
      setTimeout(() => {
        setAddedId((prev) => (prev === product.id ? null : prev))
      }, 1800)
    } finally {
      setAddingId(null)
    }
  }

  const renderProductCard = (product: HttpTypes.StoreProduct) => {
    const mode = getProductMode(product.id)
    const isAdding = addingId === product.id
    const isAdded = addedId === product.id
    const qty = getQty(product.id)
    const specs = getSpecs(product)
    const { amount: priceNum, currency } = getVariantPrice(product, mode)
    const categoryName = product.categories?.[0]?.name || "Supermercado"
    const catStyle =
      CATEGORY_STYLES[categoryName] || CATEGORY_STYLES["Frutas y Verduras"]

    return (
      <div
        key={product.id}
        className={`group bg-white rounded-2xl border transition-all duration-200 flex flex-col justify-between overflow-hidden ${
          mode === "mayor"
            ? "border-amber-300/90 shadow-md hover:shadow-xl hover:border-amber-500"
            : "border-slate-200/90 shadow-sm hover:shadow-xl hover:border-emerald-500/50"
        }`}
      >
        <div>
          {/* Product Image & Badges */}
          <div className="relative overflow-hidden">
            <LocalizedClientLink href={`/products/${product.handle}`}>
              <div className="aspect-[4/3] w-full overflow-hidden bg-slate-100 group-hover:scale-105 transition-transform duration-300">
                <Thumbnail
                  thumbnail={product.thumbnail}
                  images={product.images}
                  alt={product.title}
                  size="full"
                  className="!rounded-none !shadow-none !p-0 h-full w-full"
                />
              </div>
            </LocalizedClientLink>

            <div className="absolute top-3 left-3 flex flex-col gap-1.5">
              {mode === "mayor" ? (
                <span className="bg-amber-500 text-slate-950 text-[11px] font-extrabold px-2.5 py-1 rounded-full shadow-md">
                  📦 MAYORISTA • {specs.savingPct}
                </span>
              ) : (
                <span className="bg-emerald-600 text-white text-[11px] font-extrabold px-2.5 py-1 rounded-full shadow-md">
                  🛍️ VENTA AL DETAL
                </span>
              )}
              <span
                className={`text-[10px] font-bold px-2.5 py-0.5 rounded-full shadow-sm border w-fit backdrop-blur-md bg-white/95 text-slate-800`}
              >
                {catStyle.emoji} {categoryName}
              </span>
            </div>

            <button
              type="button"
              onClick={() => setQuickViewProduct(product)}
              className="absolute top-3 right-3 bg-white/90 hover:bg-slate-900 hover:text-white text-slate-800 text-xs font-bold px-3 py-1.5 rounded-full shadow-md backdrop-blur-md transition-all"
            >
              👁️ Ver
            </button>
          </div>

          {/* Card Content */}
          <div className="p-4">
            {/* Individual Detal / Mayor Selector inside Card */}
            <div className="grid grid-cols-2 gap-1 p-1 bg-slate-100 rounded-xl mb-3 border border-slate-200/70">
              <button
                type="button"
                onClick={() => setProductMode(product.id, "detal")}
                className={`py-1.5 px-2 rounded-lg text-[11px] font-extrabold transition-all ${
                  mode === "detal"
                    ? "bg-white text-emerald-700 shadow-sm"
                    : "text-slate-600 hover:text-slate-900"
                }`}
              >
                🛍️ Al Detal
              </button>
              <button
                type="button"
                onClick={() => setProductMode(product.id, "mayor")}
                className={`py-1.5 px-2 rounded-lg text-[11px] font-extrabold transition-all ${
                  mode === "mayor"
                    ? "bg-amber-500 text-slate-950 shadow-sm"
                    : "text-slate-600 hover:text-slate-900"
                }`}
              >
                📦 Por Mayor
              </button>
            </div>

            <div className="flex items-center justify-between text-xs text-slate-500 mb-1">
              <span className="font-bold text-amber-500">
                ★ {specs.rating}{" "}
                <span className="text-slate-400 font-normal">
                  ({specs.reviews})
                </span>
              </span>
              <span className="text-[11px] text-emerald-700 font-semibold">
                ● Stock disponible
              </span>
            </div>

            <LocalizedClientLink href={`/products/${product.handle}`}>
              <h3 className="font-extrabold text-slate-900 text-base group-hover:text-emerald-700 transition-colors line-clamp-1">
                {product.title}
              </h3>
            </LocalizedClientLink>

            {/* Format Specification Box */}
            <div
              className={`mt-2 px-2.5 py-1.5 rounded-lg text-xs font-semibold flex items-center justify-between ${
                mode === "mayor"
                  ? "bg-amber-50 text-amber-900 border border-amber-200"
                  : "bg-emerald-50/70 text-emerald-900 border border-emerald-200/60"
              }`}
            >
              <span>
                {mode === "mayor" ? "📦 Formato Mayor:" : "🛍️ Formato Detal:"}
              </span>
              <span className="font-extrabold">
                {mode === "mayor" ? specs.mayorFormat : specs.detalFormat}
              </span>
            </div>

            {/* Price Display */}
            <div className="mt-3 pt-3 border-t border-slate-100 flex items-baseline justify-between">
              <div>
                <span className="text-[11px] text-slate-400 block">
                  {mode === "mayor"
                    ? "Precio Caja / Bulto Mayorista"
                    : "Precio Unidad al Detal"}
                </span>
                <div className="flex items-baseline gap-2">
                  <span className="text-2xl font-extrabold text-slate-900">
                    {formatCurrency(priceNum, currency)}
                  </span>
                  {mode === "mayor" && (
                    <span className="text-[11px] font-bold text-amber-700 bg-amber-100 px-2 py-0.5 rounded-md">
                      {specs.savingPct}
                    </span>
                  )}
                </div>
              </div>
              <button
                type="button"
                onClick={() => setQuickViewProduct(product)}
                className="text-xs font-bold text-emerald-700 hover:underline"
              >
                Ficha +
              </button>
            </div>
          </div>
        </div>

        {/* Add to Cart Bar */}
        <div className="p-4 pt-0 flex items-center gap-2">
          <div className="flex items-center border border-slate-200 rounded-xl bg-slate-50">
            <button
              type="button"
              onClick={() => changeQty(product.id, -1)}
              className="w-8 h-9 flex items-center justify-center text-slate-700 hover:bg-slate-200 rounded-l-xl font-bold"
              aria-label="Disminuir cantidad"
            >
              −
            </button>
            <span className="w-8 text-center text-sm font-bold text-slate-900">
              {qty}
            </span>
            <button
              type="button"
              onClick={() => changeQty(product.id, 1)}
              className="w-8 h-9 flex items-center justify-center text-slate-700 hover:bg-slate-200 rounded-r-xl font-bold"
              aria-label="Aumentar cantidad"
            >
              +
            </button>
          </div>

          <button
            type="button"
            disabled={isAdding}
            onClick={() => handleQuickAdd(product)}
            className={`flex-1 h-9 rounded-xl font-extrabold text-xs sm:text-sm transition-all flex items-center justify-center gap-1.5 shadow-sm ${
              isAdded
                ? "bg-emerald-800 text-white"
                : mode === "mayor"
                ? "bg-amber-500 hover:bg-amber-400 text-slate-950 active:scale-[0.98]"
                : "bg-emerald-600 hover:bg-emerald-500 text-white active:scale-[0.98]"
            }`}
          >
            {isAdding ? (
              "Agregando..."
            ) : isAdded ? (
              "✓ ¡Agregado!"
            ) : mode === "mayor" ? (
              <>📦 Llevar por Mayor</>
            ) : (
              <>🛒 Llevar al Detal</>
            )}
          </button>
        </div>
      </div>
    )
  }

  return (
    <section id="catalogo-rapido" className="content-container py-10">
      {/* Master Wholesale / Retail Switcher Banner */}
      <div className="mb-8 rounded-3xl bg-gradient-to-r from-slate-900 via-emerald-950 to-slate-900 p-6 sm:p-8 text-white shadow-xl border border-emerald-700/40">
        <div className="flex flex-col medium:flex-row items-start medium:items-center justify-between gap-6">
          <div>
            <div className="inline-flex items-center gap-2 bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 px-3 py-1 rounded-full text-xs font-extrabold uppercase tracking-wider mb-2">
              🏪 Central de Abastos y Supermercado Digital
            </div>
            <h2 className="text-2xl sm:text-3xl font-extrabold">
              ¿Cómo deseas comprar hoy en Súper Express?
            </h2>
            <p className="text-slate-300 text-xs sm:text-sm mt-1 max-w-2xl">
              Cambia todos los precios de la tienda con un clic entre{" "}
              <strong className="text-white">Venta al Detal (Unidades para el hogar)</strong> o{" "}
              <strong className="text-amber-300">Venta al por Mayor (Cajas, Pacas y Bultos para negocios o familias grandes)</strong>.
            </p>
          </div>

          {/* Giant Toggle Buttons */}
          <div className="grid grid-cols-2 gap-2 bg-slate-800/90 p-2 rounded-2xl border border-white/10 w-full medium:w-auto shrink-0">
            <button
              type="button"
              onClick={() => handleGlobalModeSwitch("detal")}
              className={`px-5 py-3.5 rounded-xl font-extrabold text-xs sm:text-sm transition-all flex flex-col items-center gap-0.5 ${
                globalSaleMode === "detal"
                  ? "bg-emerald-500 text-slate-950 shadow-lg shadow-emerald-500/30"
                  : "text-slate-300 hover:text-white hover:bg-white/5"
              }`}
            >
              <span>🛍️ COMPRA AL DETAL</span>
              <span className="text-[10px] font-medium opacity-80">
                Unidades, Kilos y Litros
              </span>
            </button>

            <button
              type="button"
              onClick={() => handleGlobalModeSwitch("mayor")}
              className={`px-5 py-3.5 rounded-xl font-extrabold text-xs sm:text-sm transition-all flex flex-col items-center gap-0.5 ${
                globalSaleMode === "mayor"
                  ? "bg-amber-400 text-slate-950 shadow-lg shadow-amber-400/30"
                  : "text-slate-300 hover:text-white hover:bg-white/5"
              }`}
            >
              <span>📦 COMPRA AL POR MAYOR</span>
              <span className="text-[10px] font-medium opacity-80">
                Cajas, Pacas y Bultos (-25%)
              </span>
            </button>
          </div>
        </div>
      </div>

      {/* Sticky Navigation & Filter Controls */}
      <div className="flex flex-col gap-5 mb-10 bg-white p-5 sm:p-6 rounded-3xl border border-slate-200/90 shadow-sm">
        <div className="flex flex-col small:flex-row small:items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={() => setViewLayout("aisles")}
              className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-extrabold transition-all ${
                viewLayout === "aisles"
                  ? "bg-slate-900 text-white"
                  : "bg-slate-100 text-slate-700 hover:bg-slate-200"
              }`}
            >
              🏪 Ver Organizado por Pasillos
            </button>
            <button
              type="button"
              onClick={() => setViewLayout("grid")}
              className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-extrabold transition-all ${
                viewLayout === "grid"
                  ? "bg-slate-900 text-white"
                  : "bg-slate-100 text-slate-700 hover:bg-slate-200"
              }`}
            >
              🔢 Ver Cuadrícula Completa ({filteredProducts.length})
            </button>
          </div>

          <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-3">
            {/* Search input */}
            <div className="relative w-full sm:w-72">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="🔍 Buscar producto o categoría..."
                className="w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-600 focus:bg-white focus:outline-none"
              />
              {searchQuery && (
                <button
                  type="button"
                  onClick={() => setSearchQuery("")}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-slate-400 hover:text-slate-700"
                >
                  ✕
                </button>
              )}
            </div>

            {/* Sort selector */}
            <select
              value={sortBy}
              onChange={(e) => setSortBy(e.target.value as SortMode)}
              className="rounded-xl border border-slate-300 bg-slate-50 px-3.5 py-2.5 text-sm font-bold text-slate-700 focus:border-emerald-600 focus:bg-white focus:outline-none"
            >
              <option value="featured">⭐ Orden por Pasillo</option>
              <option value="price-asc">💰 Precio: Menor a Mayor</option>
              <option value="price-desc">💎 Precio: Mayor a Menor</option>
              <option value="name-asc">🔤 Nombre: A - Z</option>
            </select>
          </div>
        </div>

        {/* Department Filter Pills */}
        <div className="flex items-center gap-2 overflow-x-auto pb-1 no-scrollbar">
          <button
            type="button"
            onClick={() => setSelectedCategory("all")}
            className={`px-4 py-2.5 rounded-xl text-xs sm:text-sm font-extrabold whitespace-nowrap transition-all flex items-center gap-1.5 ${
              selectedCategory === "all"
                ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                : "bg-slate-100 text-slate-700 hover:bg-slate-200"
            }`}
          >
            🛒 Todos los Departamentos ({products.length})
          </button>
          {categories.map((cat) => {
            const style = CATEGORY_STYLES[cat.name]
            return (
              <button
                key={cat.id}
                type="button"
                onClick={() => setSelectedCategory(cat.name)}
                className={`px-4 py-2.5 rounded-xl text-xs sm:text-sm font-extrabold whitespace-nowrap transition-all flex items-center gap-1.5 ${
                  selectedCategory === cat.name
                    ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                    : "bg-slate-100 text-slate-700 hover:bg-slate-200"
                }`}
              >
                <span>{style?.emoji || "📦"}</span>
                <span>{cat.name}</span>
                <span className="opacity-75 text-xs">({cat.count})</span>
              </button>
            )
          })}
        </div>
      </div>

      {/* Empty State */}
      {filteredProducts.length === 0 && (
        <div className="bg-white rounded-3xl border border-slate-200 p-12 text-center my-6">
          <span className="text-4xl block mb-3">🔍</span>
          <h3 className="text-lg font-bold text-slate-900">
            No encontramos productos en este filtro
          </h3>
          <button
            type="button"
            onClick={() => {
              setSelectedCategory("all")
              setSearchQuery("")
            }}
            className="mt-4 px-5 py-2.5 rounded-xl bg-emerald-600 text-white font-bold text-sm hover:bg-emerald-500"
          >
            Ver todos los departamentos
          </button>
        </div>
      )}

      {/* VIEW MODE 1: ORGANIZED BY CATEGORY AISLES */}
      {viewLayout === "aisles" && selectedCategory === "all" ? (
        <div className="space-y-12">
          {groupedByCategory.map((group) => {
            const style =
              CATEGORY_STYLES[group.categoryName] ||
              CATEGORY_STYLES["Frutas y Verduras"]
            return (
              <div
                key={group.categoryName}
                id={`pasillo-${group.categoryName}`}
                className="scroll-mt-24"
              >
                {/* Category Aisle Header Banner */}
                <div
                  className={`rounded-2xl bg-gradient-to-r ${style.color} text-white p-5 sm:p-6 mb-6 shadow-md flex flex-col sm:flex-row sm:items-center justify-between gap-4`}
                >
                  <div className="flex items-center gap-4">
                    <span className="text-4xl bg-white/20 backdrop-blur-md w-14 h-14 rounded-2xl flex items-center justify-center shrink-0">
                      {style.emoji}
                    </span>
                    <div>
                      <span className="text-[11px] uppercase tracking-widest font-bold text-white/80">
                        Departamento del Supermercado
                      </span>
                      <h3 className="text-2xl font-extrabold">
                        {group.categoryName}
                      </h3>
                      <p className="text-xs sm:text-sm text-white/90 mt-0.5">
                        {style.subtitle}
                      </p>
                    </div>
                  </div>
                  <button
                    type="button"
                    onClick={() => setSelectedCategory(group.categoryName)}
                    className="bg-white/20 hover:bg-white text-white hover:text-slate-900 font-extrabold text-xs px-4 py-2.5 rounded-xl backdrop-blur-sm transition-all self-start sm:self-center shrink-0"
                  >
                    Ver solo este pasillo ({group.items.length}) →
                  </button>
                </div>

                {/* Products in this Aisle */}
                <div className="grid grid-cols-1 xsmall:grid-cols-2 small:grid-cols-3 medium:grid-cols-4 gap-6">
                  {group.items.map((product) => renderProductCard(product))}
                </div>
              </div>
            )
          })}
        </div>
      ) : (
        /* VIEW MODE 2: SINGLE FILTERED CATEGORY OR UNIFIED GRID */
        <div>
          {selectedCategory !== "all" && (
            <div className="mb-6 flex items-center justify-between bg-emerald-50 border border-emerald-200 px-5 py-4 rounded-2xl">
              <div className="flex items-center gap-3">
                <span className="text-2xl">
                  {CATEGORY_STYLES[selectedCategory]?.emoji || "🛒"}
                </span>
                <div>
                  <h3 className="font-extrabold text-slate-900 text-lg">
                    Pasillo: {selectedCategory}
                  </h3>
                  <p className="text-xs text-slate-600">
                    Mostrando {filteredProducts.length} productos disponibles al detal y al por mayor
                  </p>
                </div>
              </div>
              <button
                type="button"
                onClick={() => setSelectedCategory("all")}
                className="text-xs font-extrabold text-emerald-800 bg-white px-3.5 py-2 rounded-xl border border-emerald-300 hover:bg-emerald-100"
              >
                ← Volver a todos los pasillos
              </button>
            </div>
          )}

          <div className="grid grid-cols-1 xsmall:grid-cols-2 small:grid-cols-3 medium:grid-cols-4 gap-6">
            {filteredProducts.map((product) => renderProductCard(product))}
          </div>
        </div>
      )}

      {/* Quick View Modal with Wholesale & Retail Comparison */}
      {quickViewProduct && (
        <div
          className="fixed inset-0 z-[100] bg-slate-950/60 backdrop-blur-sm flex items-center justify-center p-4"
          onClick={() => setQuickViewProduct(null)}
        >
          <div
            className="bg-white rounded-3xl max-w-2xl w-full overflow-hidden shadow-2xl border border-slate-200 grid grid-cols-1 sm:grid-cols-2"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="relative aspect-square sm:aspect-auto bg-slate-100">
              <Thumbnail
                thumbnail={quickViewProduct.thumbnail}
                images={quickViewProduct.images}
                alt={quickViewProduct.title}
                size="full"
                className="!rounded-none !shadow-none !p-0 h-full"
              />
              <span className="absolute top-4 left-4 bg-emerald-600 text-white text-xs font-extrabold px-3 py-1 rounded-full shadow">
                {quickViewProduct.categories?.[0]?.name || "Supermercado"}
              </span>
            </div>

            <div className="p-6 flex flex-col justify-between gap-4">
              <div>
                <div className="flex justify-between items-start gap-2">
                  <span className="text-xs font-bold text-amber-500">
                    ★★★★★ {getSpecs(quickViewProduct).rating} (
                    {getSpecs(quickViewProduct).reviews} reseñas)
                  </span>
                  <button
                    type="button"
                    onClick={() => setQuickViewProduct(null)}
                    className="w-8 h-8 rounded-full bg-slate-100 hover:bg-slate-200 flex items-center justify-center text-slate-600 font-bold"
                  >
                    ✕
                  </button>
                </div>

                <h3 className="text-xl font-extrabold text-slate-900 mt-2">
                  {quickViewProduct.title}
                </h3>

                <p className="text-xs sm:text-sm text-slate-600 mt-2 leading-relaxed">
                  {quickViewProduct.description}
                </p>

                {/* Modal Wholesale vs Retail Selector */}
                <div className="mt-4 space-y-2">
                  <span className="text-xs font-extrabold uppercase tracking-wider text-slate-500 block">
                    Elige tu modalidad de compra:
                  </span>

                  <button
                    type="button"
                    onClick={() => setProductMode(quickViewProduct.id, "detal")}
                    className={`w-full p-3 rounded-xl border text-left flex items-center justify-between transition-all ${
                      getProductMode(quickViewProduct.id) === "detal"
                        ? "border-emerald-600 bg-emerald-50/70 ring-2 ring-emerald-500/20"
                        : "border-slate-200 hover:bg-slate-50"
                    }`}
                  >
                    <div>
                      <span className="font-extrabold text-slate-900 text-xs block">
                        🛍️ Al Detal (Unidad / Hogar)
                      </span>
                      <span className="text-xs text-slate-600">
                        {getSpecs(quickViewProduct).detalFormat}
                      </span>
                    </div>
                    <span className="text-base font-extrabold text-emerald-700">
                      {formatCurrency(
                        getVariantPrice(quickViewProduct, "detal").amount
                      )}
                    </span>
                  </button>

                  <button
                    type="button"
                    onClick={() => setProductMode(quickViewProduct.id, "mayor")}
                    className={`w-full p-3 rounded-xl border text-left flex items-center justify-between transition-all ${
                      getProductMode(quickViewProduct.id) === "mayor"
                        ? "border-amber-500 bg-amber-50/80 ring-2 ring-amber-500/20"
                        : "border-slate-200 hover:bg-slate-50"
                    }`}
                  >
                    <div>
                      <span className="font-extrabold text-slate-900 text-xs block">
                        📦 Al por Mayor ({getSpecs(quickViewProduct).savingPct})
                      </span>
                      <span className="text-xs text-slate-600">
                        {getSpecs(quickViewProduct).mayorFormat}
                      </span>
                    </div>
                    <span className="text-base font-extrabold text-amber-700">
                      {formatCurrency(
                        getVariantPrice(quickViewProduct, "mayor").amount
                      )}
                    </span>
                  </button>
                </div>
              </div>

              <div className="pt-3 border-t border-slate-200">
                <div className="flex items-center gap-3">
                  <div className="flex items-center border border-slate-300 rounded-xl bg-slate-50">
                    <button
                      type="button"
                      onClick={() => changeQty(quickViewProduct.id, -1)}
                      className="w-9 h-10 flex items-center justify-center font-bold text-slate-700"
                    >
                      −
                    </button>
                    <span className="w-9 text-center font-bold text-slate-900">
                      {getQty(quickViewProduct.id)}
                    </span>
                    <button
                      type="button"
                      onClick={() => changeQty(quickViewProduct.id, 1)}
                      className="w-9 h-10 flex items-center justify-center font-bold text-slate-700"
                    >
                      +
                    </button>
                  </div>

                  <button
                    type="button"
                    disabled={addingId === quickViewProduct.id}
                    onClick={() => handleQuickAdd(quickViewProduct)}
                    className={`flex-1 h-10 rounded-xl font-extrabold text-sm shadow-md ${
                      getProductMode(quickViewProduct.id) === "mayor"
                        ? "bg-amber-500 hover:bg-amber-400 text-slate-950"
                        : "bg-emerald-600 hover:bg-emerald-500 text-white"
                    }`}
                  >
                    {addingId === quickViewProduct.id
                      ? "Agregando..."
                      : addedId === quickViewProduct.id
                      ? "✓ ¡Agregado al Carrito!"
                      : getProductMode(quickViewProduct.id) === "mayor"
                      ? "📦 Agregar Caja Mayorista"
                      : "🛒 Agregar Unidad al Detal"}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </section>
  )
}
