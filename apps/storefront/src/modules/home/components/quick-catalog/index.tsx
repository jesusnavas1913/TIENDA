"use client"

import { addToCart } from "@lib/data/cart"
import { notifyCartUpdated } from "@lib/util/cart-events"
import { HttpTypes } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import Thumbnail from "@modules/products/components/thumbnail"
import { useParams } from "next/navigation"
import { useMemo, useState } from "react"

export default function QuickSupermarketCatalog({
  products,
}: {
  products: HttpTypes.StoreProduct[]
}) {
  const [selectedCategory, setSelectedCategory] = useState<string>("all")
  const [searchQuery, setSearchQuery] = useState<string>("")
  const [addingId, setAddingId] = useState<string | null>(null)
  const [addedId, setAddedId] = useState<string | null>(null)
  const [quantities, setQuantities] = useState<Record<string, number>>({})
  const countryCode = (useParams()?.countryCode as string) || "dk"

  const categories = useMemo(() => {
    const map = new Map<string, string>()
    products.forEach((p) => {
      p.categories?.forEach((c) => {
        if (c.id && c.name) map.set(c.id, c.name)
      })
    })
    return Array.from(map.entries()).map(([id, name]) => ({ id, name }))
  }, [products])

  const filteredProducts = useMemo(() => {
    return products.filter((p) => {
      const matchesCat =
        selectedCategory === "all" ||
        p.categories?.some((c) => c.id === selectedCategory)
      const matchesSearch =
        !searchQuery.trim() ||
        p.title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
        p.description?.toLowerCase().includes(searchQuery.toLowerCase())
      return matchesCat && matchesSearch
    })
  }, [products, selectedCategory, searchQuery])

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

  const formatVariantPrice = (product: HttpTypes.StoreProduct) => {
    const v = product.variants?.[0] as any
    const calc = v?.calculated_price
    if (calc?.calculated_amount != null) {
      return new Intl.NumberFormat("es-ES", {
        style: "currency",
        currency: (calc.currency_code || "EUR").toUpperCase(),
      }).format(calc.calculated_amount)
    }
    return "€10,00"
  }

  return (
    <section id="catalogo-rapido" className="content-container py-12">
      {/* Header & Filter Bar */}
      <div className="flex flex-col gap-6 mb-8">
        <div className="flex flex-col small:flex-row small:items-end justify-between gap-4">
          <div>
            <span className="text-emerald-600 font-bold text-xs uppercase tracking-widest">
              Compra Directa en 1 Clic
            </span>
            <h2 className="text-3xl font-extrabold text-slate-900 mt-1">
              Pasillos del Autoservicio
            </h2>
            <p className="text-slate-500 text-sm mt-1">
              Elige la cantidad y agrega tus productos directo al carrito sin salir de la página.
            </p>
          </div>

          {/* Search input */}
          <div className="relative w-full small:w-80">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="🔍 Buscar producto en el súper..."
              className="w-full rounded-xl border border-slate-300 bg-white px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-600 focus:outline-none focus:ring-2 focus:ring-emerald-500/20 shadow-sm"
            />
          </div>
        </div>

        {/* Category Pills */}
        <div className="flex items-center gap-2 overflow-x-auto pb-2 no-scrollbar">
          <button
            onClick={() => setSelectedCategory("all")}
            className={`px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap transition-all ${
              selectedCategory === "all"
                ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                : "bg-slate-100 text-slate-700 hover:bg-slate-200"
            }`}
          >
            🛒 Todos los Productos ({products.length})
          </button>
          {categories.map((cat) => (
            <button
              key={cat.id}
              onClick={() => setSelectedCategory(cat.id)}
              className={`px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap transition-all ${
                selectedCategory === cat.id
                  ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/25"
                  : "bg-slate-100 text-slate-700 hover:bg-slate-200"
              }`}
            >
              {cat.name}
            </button>
          ))}
        </div>
      </div>

      {/* Product Grid */}
      <div className="grid grid-cols-1 xsmall:grid-cols-2 small:grid-cols-3 medium:grid-cols-4 gap-6">
        {filteredProducts.map((product) => {
          const isAdding = addingId === product.id
          const isAdded = addedId === product.id
          const qty = getQty(product.id)
          const categoryName = product.categories?.[0]?.name || "Autoservicio"

          return (
            <div
              key={product.id}
              className="group bg-white rounded-2xl border border-slate-200/90 shadow-sm hover:shadow-xl hover:border-emerald-500/40 transition-all duration-200 flex flex-col justify-between overflow-hidden"
            >
              <div>
                <div className="relative">
                  <LocalizedClientLink href={`/products/${product.handle}`}>
                    <div className="aspect-square w-full overflow-hidden bg-slate-50">
                      <Thumbnail
                        thumbnail={product.thumbnail}
                        images={product.images}
                        alt={product.title}
                        size="square"
                        className="!rounded-none !shadow-none !p-0"
                      />
                    </div>
                  </LocalizedClientLink>
                  <span className="absolute top-3 left-3 bg-white/90 backdrop-blur-md text-slate-800 text-[11px] font-bold px-2.5 py-1 rounded-full shadow-sm border border-slate-200/60">
                    {categoryName}
                  </span>
                  <span className="absolute top-3 right-3 bg-emerald-600 text-white text-[11px] font-bold px-2.5 py-1 rounded-full shadow-sm">
                    Disponible
                  </span>
                </div>

                <div className="p-4">
                  <LocalizedClientLink href={`/products/${product.handle}`}>
                    <h3 className="font-bold text-slate-900 text-base group-hover:text-emerald-700 transition-colors line-clamp-1">
                      {product.title}
                    </h3>
                  </LocalizedClientLink>
                  {product.description && (
                    <p className="text-xs text-slate-500 mt-1 line-clamp-2 min-h-[32px]">
                      {product.description}
                    </p>
                  )}

                  <div className="mt-3 flex items-baseline justify-between">
                    <div>
                      <span className="text-xs text-slate-400 block">Precio unidad</span>
                      <span className="text-xl font-extrabold text-slate-900">
                        {formatVariantPrice(product)}
                      </span>
                    </div>
                    <span className="text-[11px] text-emerald-700 bg-emerald-50 font-semibold px-2 py-0.5 rounded-md">
                      {product.variants?.[0]?.title || "1 ud."}
                    </span>
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
                      ? "bg-emerald-700 text-white"
                      : "bg-emerald-600 hover:bg-emerald-500 text-white active:scale-[0.98]"
                  }`}
                >
                  {isAdding ? (
                    "Agregando..."
                  ) : isAdded ? (
                    "✓ ¡Agregado!"
                  ) : (
                    <>+ Agregar</>
                  )}
                </button>
              </div>
            </div>
          )
        })}
      </div>
    </section>
  )
}

