"use client"

import { addToCart } from "@lib/data/cart"
import { notifyCartUpdated } from "@lib/util/cart-events"
import { HttpTypes } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import Thumbnail from "@modules/products/components/thumbnail"
import { useParams } from "next/navigation"
import { useMemo, useState } from "react"

type SortMode = "featured" | "price-asc" | "price-desc" | "name-asc"

const PROMO_DATA: Record<
  string,
  {
    badge?: string
    oldPriceMultiplier?: number
    rating: string
    reviews: number
    origin: string
    unitInfo: string
    nutrition: string
  }
> = {
  "aguacate-hass-organico": {
    badge: "🔥 Oferta -20%",
    oldPriceMultiplier: 1.25,
    rating: "4.9",
    reviews: 148,
    origin: "Cosecha Orgánica Certificada",
    unitInfo: "Malla x 500g (aprox. 3-4 uds)",
    nutrition: "Rico en grasas saludables Omega-9, Potasio y Vitamina E",
  },
  "fresas-frescas-500g": {
    badge: "🍓 Recién Llegado",
    oldPriceMultiplier: 1.3,
    rating: "4.8",
    reviews: 94,
    origin: "Invernadero Hidropónico Local",
    unitInfo: "Bandeja x 500g seleccionadas",
    nutrition: "Alto contenido en antioxidantes y Vitamina C",
  },
  "cafe-grano-artesanal": {
    badge: "⭐ Top Ventas",
    oldPriceMultiplier: 1.2,
    rating: "5.0",
    reviews: 215,
    origin: "Finca de Altura 1.800 msnm",
    unitInfo: "Bolsa con válvula x 500g",
    nutrition: "100% Arábica lavado, tueste medio sin azúcar añadida",
  },
  "aceite-oliva-virgen-extra": {
    badge: "🏆 Gourmet",
    oldPriceMultiplier: 1.15,
    rating: "4.9",
    reviews: 87,
    origin: "Primera Prensa en Frío",
    unitInfo: "Botella cristal oscuro x 750ml",
    nutrition: "Acidez < 0.2°, rico en polifenoles naturales",
  },
  "leche-entera-fresca-1l": {
    badge: "🥛 Básica del Día",
    rating: "4.8",
    reviews: 162,
    origin: "Granjas de Libre Pastoreo",
    unitInfo: "Envase Tetra Pak x 1 Litro",
    nutrition: "Fuente natural de Calcio, Proteína y Vitaminas A & D",
  },
  "huevos-camperos-docena": {
    badge: "🥚 Gallinas Libres",
    oldPriceMultiplier: 1.2,
    rating: "4.9",
    reviews: 190,
    origin: "Granja Avícola Sostenible",
    unitInfo: "Estuche protector x 12 unidades AA",
    nutrition: "6.5g de proteína pura por huevo, yema intensa natural",
  },
  "jugo-naranja-exprimido": {
    badge: "🍊 100% Natural",
    rating: "4.7",
    reviews: 73,
    origin: "Naranjas Valencia Recién Exprimidas",
    unitInfo: "Botella refrigerada x 1 Litro",
    nutrition: "Sin azúcar añadida, sin agua ni conservantes",
  },
  "pan-artesanal-masa-madre": {
    badge: "🥖 Horneado Hoy",
    oldPriceMultiplier: 1.2,
    rating: "4.9",
    reviews: 129,
    origin: "Obrador Artesanal Local",
    unitInfo: "Hogaza rústica x 650g",
    nutrition: "Fermentación lenta de 24h, bajo índice glucémico",
  },
}

const getMeta = (handle?: string | null) => {
  if (handle && PROMO_DATA[handle]) return PROMO_DATA[handle]
  return {
    badge: "✨ Destacado",
    oldPriceMultiplier: 1.2,
    rating: "4.8",
    reviews: 52,
    origin: "Selección Súper Express",
    unitInfo: "Presentación Estándar Garantizada",
    nutrition: "Calidad verificada bajo estándares de frescura",
  }
}

export default function QuickSupermarketCatalog({
  products,
}: {
  products: HttpTypes.StoreProduct[]
}) {
  const [selectedCategory, setSelectedCategory] = useState<string>("all")
  const [searchQuery, setSearchQuery] = useState<string>("")
  const [sortBy, setSortBy] = useState<SortMode>("featured")
  const [onlyOffers, setOnlyOffers] = useState<boolean>(false)
  const [addingId, setAddingId] = useState<string | null>(null)
  const [addedId, setAddedId] = useState<string | null>(null)
  const [quantities, setQuantities] = useState<Record<string, number>>({})
  const [quickViewProduct, setQuickViewProduct] =
    useState<HttpTypes.StoreProduct | null>(null)

  const countryCode = (useParams()?.countryCode as string) || "dk"

  const categories = useMemo(() => {
    const map = new Map<string, { name: string; count: number }>()
    products.forEach((p) => {
      p.categories?.forEach((c) => {
        if (c.id && c.name) {
          const prev = map.get(c.id)
          map.set(c.id, { name: c.name, count: (prev?.count || 0) + 1 })
        }
      })
    })
    return Array.from(map.entries()).map(([id, data]) => ({
      id,
      name: data.name,
      count: data.count,
    }))
  }, [products])

  const getNumericPrice = (product: HttpTypes.StoreProduct): number => {
    const v = product.variants?.[0] as any
    return v?.calculated_price?.calculated_amount ?? 10
  }

  const formatCurrency = (amount: number, currency = "EUR") =>
    new Intl.NumberFormat("es-ES", {
      style: "currency",
      currency: currency.toUpperCase(),
    }).format(amount)

  const filteredProducts = useMemo(() => {
    const list = products.filter((p) => {
      const matchesCat =
        selectedCategory === "all" ||
        p.categories?.some((c) => c.id === selectedCategory)
      const matchesSearch =
        !searchQuery.trim() ||
        p.title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
        p.description?.toLowerCase().includes(searchQuery.toLowerCase())
      const meta = getMeta(p.handle)
      const matchesOffer = !onlyOffers || !!meta.oldPriceMultiplier
      return matchesCat && matchesSearch && matchesOffer
    })

    return [...list].sort((a, b) => {
      if (sortBy === "price-asc") return getNumericPrice(a) - getNumericPrice(b)
      if (sortBy === "price-desc")
        return getNumericPrice(b) - getNumericPrice(a)
      if (sortBy === "name-asc")
        return (a.title || "").localeCompare(b.title || "")
      // Prioritize supermarket items over default apparel items
      const aIsSuper = a.handle && PROMO_DATA[a.handle] ? 0 : 1
      const bIsSuper = b.handle && PROMO_DATA[b.handle] ? 0 : 1
      return aIsSuper - bIsSuper
    })
  }, [products, selectedCategory, searchQuery, sortBy, onlyOffers])

  const getQty = (productId: string) => quantities[productId] || 1

  const changeQty = (productId: string, delta: number) => {
    setQuantities((prev) => {
      const next = Math.max(1, (prev[productId] || 1) + delta)
      return { ...prev, [productId]: next }
    })
  }

  const handleQuickAdd = async (product: HttpTypes.StoreProduct) => {
    const defaultVariant = product.variants?.[0]
    if (!defaultVariant?.id) return

    setAddingId(product.id)
    try {
      await addToCart({
        variantId: defaultVariant.id,
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

  return (
    <section id="catalogo-rapido" className="content-container py-10">
      {/* Flash Deals Banner */}
      <div className="mb-10 rounded-3xl bg-gradient-to-r from-amber-500 via-orange-500 to-rose-600 p-6 sm:p-8 text-white shadow-xl flex flex-col small:flex-row items-start small:items-center justify-between gap-6">
        <div className="flex items-center gap-4">
          <div className="w-14 h-14 rounded-2xl bg-white/20 backdrop-blur-md flex items-center justify-center text-3xl shrink-0">
            ⚡
          </div>
          <div>
            <div className="inline-flex items-center gap-2 bg-black/25 px-3 py-0.5 rounded-full text-xs font-bold uppercase tracking-wider mb-1">
              Ofertas Relámpago del Día
            </div>
            <h3 className="text-xl sm:text-2xl font-extrabold">
              Hasta 25% de descuento en Frescos y Despensa
            </h3>
            <p className="text-white/90 text-xs sm:text-sm">
              Precios especiales aplicados directamente. ¡Aprovecha antes de que se agoten!
            </p>
          </div>
        </div>

        <button
          type="button"
          onClick={() => setOnlyOffers((prev) => !prev)}
          className={`px-5 py-3 rounded-xl font-bold text-xs sm:text-sm transition-all shrink-0 shadow-md ${
            onlyOffers
              ? "bg-slate-900 text-white"
              : "bg-white text-rose-700 hover:bg-rose-50"
          }`}
        >
          {onlyOffers ? "✓ Viendo Solo Ofertas (Ver Todo)" : "🔥 Filtrar Solo Ofertas"}
        </button>
      </div>

      {/* Header & Controls */}
      <div className="flex flex-col gap-6 mb-8 bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm">
        <div className="flex flex-col small:flex-row small:items-center justify-between gap-4">
          <div>
            <span className="text-emerald-600 font-bold text-xs uppercase tracking-widest">
              Experiencia de Compra Inteligente
            </span>
            <h2 className="text-2xl sm:text-3xl font-extrabold text-slate-900 mt-0.5">
              Explora nuestros Pasillos ({filteredProducts.length} productos)
            </h2>
          </div>

          <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-3">
            {/* Search input */}
            <div className="relative w-full sm:w-72">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="🔍 Buscar ej: aguacate, café, leche..."
                className="w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-600 focus:bg-white focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
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
              className="rounded-xl border border-slate-300 bg-slate-50 px-3.5 py-2.5 text-sm font-medium text-slate-700 focus:border-emerald-600 focus:bg-white focus:outline-none"
            >
              <option value="featured">⭐ Más Destacados</option>
              <option value="price-asc">💰 Precio: Menor a Mayor</option>
              <option value="price-desc">💎 Precio: Mayor a Menor</option>
              <option value="name-asc">🔤 Nombre: A - Z</option>
            </select>
          </div>
        </div>

        {/* Category Pills */}
        <div className="flex items-center gap-2 overflow-x-auto pb-1 no-scrollbar">
          <button
            onClick={() => setSelectedCategory("all")}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold whitespace-nowrap transition-all ${
              selectedCategory === "all"
                ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                : "bg-slate-100 text-slate-700 hover:bg-slate-200"
            }`}
          >
            🛒 Todo el Súper ({products.length})
          </button>
          {categories.map((cat) => (
            <button
              key={cat.id}
              onClick={() => setSelectedCategory(cat.id)}
              className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold whitespace-nowrap transition-all ${
                selectedCategory === cat.id
                  ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                  : "bg-slate-100 text-slate-700 hover:bg-slate-200"
              }`}
            >
              {cat.name} ({cat.count})
            </button>
          ))}
        </div>
      </div>

      {/* Empty Filter State */}
      {filteredProducts.length === 0 && (
        <div className="bg-white rounded-3xl border border-slate-200 p-12 text-center my-6">
          <span className="text-4xl block mb-3">🔍</span>
          <h3 className="text-lg font-bold text-slate-900">
            No encontramos productos con ese filtro
          </h3>
          <p className="text-sm text-slate-500 mt-1 mb-4">
            Intenta con otra palabra clave o restablece los filtros activos.
          </p>
          <button
            type="button"
            onClick={() => {
              setSelectedCategory("all")
              setSearchQuery("")
              setOnlyOffers(false)
            }}
            className="px-5 py-2.5 rounded-xl bg-emerald-600 text-white font-bold text-sm hover:bg-emerald-500"
          >
            Mostrar todos los productos
          </button>
        </div>
      )}

      {/* Product Grid */}
      <div className="grid grid-cols-1 xsmall:grid-cols-2 small:grid-cols-3 medium:grid-cols-4 gap-6">
        {filteredProducts.map((product) => {
          const isAdding = addingId === product.id
          const isAdded = addedId === product.id
          const qty = getQty(product.id)
          const categoryName = product.categories?.[0]?.name || "Autoservicio"
          const meta = getMeta(product.handle)
          const priceNum = getNumericPrice(product)
          const currencyCode =
            (product.variants?.[0] as any)?.calculated_price?.currency_code ||
            "EUR"
          const oldPrice = meta.oldPriceMultiplier
            ? Math.round(priceNum * meta.oldPriceMultiplier * 100) / 100
            : null

          return (
            <div
              key={product.id}
              className="group bg-white rounded-2xl border border-slate-200/90 shadow-sm hover:shadow-xl hover:border-emerald-500/50 transition-all duration-200 flex flex-col justify-between overflow-hidden"
            >
              <div>
                <div className="relative overflow-hidden">
                  <LocalizedClientLink href={`/products/${product.handle}`}>
                    <div className="aspect-square w-full overflow-hidden bg-slate-50 group-hover:scale-105 transition-transform duration-300">
                      <Thumbnail
                        thumbnail={product.thumbnail}
                        images={product.images}
                        alt={product.title}
                        size="square"
                        className="!rounded-none !shadow-none !p-0"
                      />
                    </div>
                  </LocalizedClientLink>

                  {/* Top Badges */}
                  <div className="absolute top-3 left-3 flex flex-col gap-1.5">
                    {meta.badge && (
                      <span className="bg-rose-600 text-white text-[11px] font-extrabold px-2.5 py-1 rounded-full shadow-sm">
                        {meta.badge}
                      </span>
                    )}
                    <span className="bg-white/95 backdrop-blur-md text-slate-800 text-[10px] font-bold px-2.5 py-0.5 rounded-full shadow-sm border border-slate-200/60 w-fit">
                      {categoryName}
                    </span>
                  </div>

                  {/* Quick View Eye Button */}
                  <button
                    type="button"
                    onClick={() => setQuickViewProduct(product)}
                    className="absolute top-3 right-3 bg-white/90 hover:bg-slate-900 hover:text-white text-slate-800 text-xs font-bold px-3 py-1.5 rounded-full shadow-md backdrop-blur-md transition-all flex items-center gap-1"
                    title="Vista rápida del producto"
                  >
                    👁️ Ver
                  </button>
                </div>

                <div className="p-4">
                  {/* Rating & Origin */}
                  <div className="flex items-center justify-between text-xs text-slate-500 mb-1.5">
                    <span className="font-semibold text-amber-500 flex items-center gap-1">
                      ★ {meta.rating}{" "}
                      <span className="text-slate-400 font-normal">
                        ({meta.reviews})
                      </span>
                    </span>
                    <span className="text-[11px] text-emerald-700 font-medium">
                      ● En stock
                    </span>
                  </div>

                  <LocalizedClientLink href={`/products/${product.handle}`}>
                    <h3 className="font-bold text-slate-900 text-base group-hover:text-emerald-700 transition-colors line-clamp-1">
                      {product.title}
                    </h3>
                  </LocalizedClientLink>

                  <p className="text-[11px] text-slate-500 font-medium mt-0.5">
                    📦 {meta.unitInfo}
                  </p>

                  {product.description && (
                    <p className="text-xs text-slate-500 mt-1.5 line-clamp-2 min-h-[32px]">
                      {product.description}
                    </p>
                  )}

                  <div className="mt-3 pt-3 border-t border-slate-100 flex items-baseline justify-between">
                    <div>
                      <span className="text-[11px] text-slate-400 block">
                        Precio final
                      </span>
                      <div className="flex items-baseline gap-2">
                        <span className="text-xl font-extrabold text-slate-900">
                          {formatCurrency(priceNum, currencyCode)}
                        </span>
                        {oldPrice && (
                          <span className="text-xs text-slate-400 line-through">
                            {formatCurrency(oldPrice, currencyCode)}
                          </span>
                        )}
                      </div>
                    </div>
                    <button
                      type="button"
                      onClick={() => setQuickViewProduct(product)}
                      className="text-xs font-semibold text-emerald-700 hover:underline"
                    >
                      Detalles +
                    </button>
                  </div>
                </div>
              </div>

              {/* Quick Add Controls */}
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
                  className={`flex-1 h-9 rounded-xl font-bold text-xs sm:text-sm transition-all flex items-center justify-center gap-1.5 shadow-sm ${
                    isAdded
                      ? "bg-emerald-800 text-white"
                      : "bg-emerald-600 hover:bg-emerald-500 text-white active:scale-[0.98]"
                  }`}
                >
                  {isAdding ? (
                    "Agregando..."
                  ) : isAdded ? (
                    "✓ ¡En tu carrito!"
                  ) : (
                    <>🛒 Agregar</>
                  )}
                </button>
              </div>
            </div>
          )
        })}
      </div>

      {/* Quick View Modal */}
      {quickViewProduct && (
        <div
          className="fixed inset-0 z-[100] bg-slate-950/60 backdrop-blur-sm flex items-center justify-center p-4"
          onClick={() => setQuickViewProduct(null)}
        >
          <div
            className="bg-white rounded-3xl max-w-2xl w-full overflow-hidden shadow-2xl border border-slate-200 grid grid-cols-1 sm:grid-cols-2 animate-in fade-in zoom-in-95 duration-150"
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
              <span className="absolute top-4 left-4 bg-emerald-600 text-white text-xs font-bold px-3 py-1 rounded-full">
                {getMeta(quickViewProduct.handle).badge}
              </span>
            </div>

            <div className="p-6 flex flex-col justify-between gap-4">
              <div>
                <div className="flex justify-between items-start gap-2">
                  <span className="text-xs font-bold uppercase tracking-wider text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded-md">
                    {quickViewProduct.categories?.[0]?.name || "Supermercado"}
                  </span>
                  <button
                    type="button"
                    onClick={() => setQuickViewProduct(null)}
                    className="w-8 h-8 rounded-full bg-slate-100 hover:bg-slate-200 flex items-center justify-center text-slate-600 font-bold"
                  >
                    ✕
                  </button>
                </div>

                <h3 className="text-xl font-extrabold text-slate-900 mt-3">
                  {quickViewProduct.title}
                </h3>

                <div className="flex items-center gap-2 mt-1 text-xs text-amber-500 font-bold">
                  ★★★★★ {getMeta(quickViewProduct.handle).rating} (
                  {getMeta(quickViewProduct.handle).reviews} opiniones verificadas)
                </div>

                <p className="text-sm text-slate-600 mt-3 leading-relaxed">
                  {quickViewProduct.description}
                </p>

                {/* Extra Nutritional & Origin Specs */}
                <div className="mt-4 space-y-2 bg-slate-50 p-3.5 rounded-2xl border border-slate-200/70 text-xs">
                  <div>
                    <span className="font-bold text-slate-800">🌱 Origen: </span>
                    <span className="text-slate-600">
                      {getMeta(quickViewProduct.handle).origin}
                    </span>
                  </div>
                  <div>
                    <span className="font-bold text-slate-800">📦 Formato: </span>
                    <span className="text-slate-600">
                      {getMeta(quickViewProduct.handle).unitInfo}
                    </span>
                  </div>
                  <div>
                    <span className="font-bold text-slate-800">💚 Aporte: </span>
                    <span className="text-slate-600">
                      {getMeta(quickViewProduct.handle).nutrition}
                    </span>
                  </div>
                </div>
              </div>

              <div className="pt-3 border-t border-slate-200">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <span className="text-xs text-slate-400 block">
                      Precio por unidad
                    </span>
                    <span className="text-2xl font-extrabold text-slate-900">
                      {formatCurrency(getNumericPrice(quickViewProduct))}
                    </span>
                  </div>
                  <LocalizedClientLink
                    href={`/products/${quickViewProduct.handle}`}
                    className="text-xs font-bold text-emerald-700 hover:underline"
                  >
                    Ir a ficha completa →
                  </LocalizedClientLink>
                </div>

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
                    className="flex-1 h-10 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-sm shadow-md"
                  >
                    {addingId === quickViewProduct.id
                      ? "Agregando..."
                      : addedId === quickViewProduct.id
                      ? "✓ ¡Agregado al Carrito!"
                      : "🛒 Agregar al Carrito"}
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
