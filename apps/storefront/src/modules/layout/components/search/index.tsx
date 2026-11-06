"use client"

import { addToCart } from "@lib/data/cart"
import { listProducts } from "@lib/data/products"
import useToggleState from "@lib/hooks/use-toggle-state"
import { notifyCartUpdated } from "@lib/util/cart-events"
import { formatCOP } from "@lib/util/money"
import { MagnifyingGlass } from "@medusajs/icons"
import { HttpTypes } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import Thumbnail from "@modules/products/components/thumbnail"
import { useParams } from "next/navigation"
import { useEffect, useMemo, useState } from "react"
import SearchDrawer from "./drawer"

const Search = () => {
  const { state: isOpen, open, close } = useToggleState()
  const params = useParams<{ countryCode: string }>()
  const countryCode = params?.countryCode || "co"

  const [products, setProducts] = useState<HttpTypes.StoreProduct[]>([])
  const [loading, setLoading] = useState(false)
  const [query, setQuery] = useState("")
  const [addingId, setAddingId] = useState<string | null>(null)
  const [addedId, setAddedId] = useState<string | null>(null)

  useEffect(() => {
    if (!isOpen || products.length > 0) return
    setLoading(true)
    listProducts({
      countryCode,
      queryParams: {
        limit: 50,
        fields: "*variants.calculated_price,*categories,+metadata",
      },
    })
      .then(({ response }) => {
        setProducts(response.products || [])
      })
      .catch(() => {})
      .finally(() => setLoading(false))
  }, [isOpen, countryCode, products.length])

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return products.slice(0, 8)
    return products.filter((p) => {
      const barcode = (
        (p.metadata as any)?.barcode ||
        p.variants?.[0]?.barcode ||
        ""
      ).toLowerCase()
      const cat = (p.categories?.[0]?.name || "").toLowerCase()
      return (
        p.title?.toLowerCase().includes(q) ||
        p.description?.toLowerCase().includes(q) ||
        barcode.includes(q) ||
        cat.includes(q)
      )
    })
  }, [products, query])

  const getPrices = (p: HttpTypes.StoreProduct) => {
    const variants = p.variants || []
    const detalVar =
      variants.find((v) => v.title?.toLowerCase().includes("detal")) ||
      variants[0]
    const mayorVar =
      variants.find((v) => v.title?.toLowerCase().includes("mayor")) ||
      variants[1]

    const extractCop = (v: any, fallback: number) => {
      const calc = v?.calculated_price?.calculated_amount
      const code = (v?.calculated_price?.currency_code || "COP").toUpperCase()
      if (calc != null) {
        return code !== "COP" && calc < 500 ? calc * 2000 : calc
      }
      return fallback
    }

    return {
      detalVar,
      mayorVar,
      detalCop: extractCop(detalVar, 6500),
      mayorCop: extractCop(mayorVar, 52000),
      barcode:
        (p.metadata as any)?.barcode ||
        detalVar?.barcode ||
        "7701001001",
    }
  }

  const handleQuickAdd = async (variantId?: string, key?: string) => {
    if (!variantId || !key) return
    setAddingId(key)
    try {
      await addToCart({
        variantId,
        quantity: 1,
        countryCode,
      })
      notifyCartUpdated()
      setAddedId(key)
      setTimeout(() => {
        setAddedId((prev) => (prev === key ? null : prev))
      }, 1500)
    } finally {
      setAddingId(null)
    }
  }

  return (
    <>
      <button
        type="button"
        onClick={open}
        aria-label="Buscar productos"
        className="flex items-center gap-2 bg-slate-100 hover:bg-emerald-50 text-slate-700 hover:text-emerald-700 px-3.5 py-1.5 rounded-full border border-slate-200 transition-colors text-xs font-bold"
        data-testid="nav-search-button"
      >
        <MagnifyingGlass className="w-4 h-4" />
        <span className="hidden sm:inline">Buscar / Código 770...</span>
      </button>

      <SearchDrawer isOpen={isOpen} close={close}>
        <div className="p-4 border-b border-slate-200 bg-slate-50">
          <div className="relative">
            <input
              type="search"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="🔫 Escribe producto, categoría o código 770..."
              autoFocus
              className="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-600 focus:outline-none shadow-sm"
            />
          </div>
          <div className="flex flex-wrap items-center gap-1.5 mt-2.5 text-[11px]">
            <span className="text-slate-400 font-semibold">Rápido:</span>
            {["Aguacate", "Café", "Arroz", "Huevos", "Leche", "770"].map(
              (chip) => (
                <button
                  key={chip}
                  type="button"
                  onClick={() => setQuery(chip)}
                  className="px-2 py-0.5 rounded-md bg-white border border-slate-200 text-slate-700 hover:border-emerald-500 hover:text-emerald-700 font-semibold"
                >
                  {chip}
                </button>
              )
            )}
          </div>
        </div>

        <div className="flex-1 overflow-y-auto p-4 space-y-3">
          {loading ? (
            <div className="py-12 text-center text-sm text-slate-500">
              Cargando catálogo de Colombia...
            </div>
          ) : filtered.length === 0 ? (
            <div className="py-12 text-center">
              <p className="text-sm font-bold text-slate-800">
                No encontramos &quot;{query}&quot;
              </p>
              <button
                type="button"
                onClick={() => setQuery("")}
                className="mt-2 text-xs text-emerald-700 font-bold underline"
              >
                Ver productos sugeridos
              </button>
            </div>
          ) : (
            filtered.map((p) => {
              const info = getPrices(p)
              const detalKey = `${p.id}-detal`
              const mayorKey = `${p.id}-mayor`

              return (
                <div
                  key={p.id}
                  className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm hover:border-emerald-500/50 transition-all flex gap-3"
                >
                  <LocalizedClientLink
                    href={`/products/${p.handle}`}
                    onClick={close}
                    className="w-20 h-20 rounded-xl overflow-hidden bg-slate-100 shrink-0"
                  >
                    <Thumbnail
                      thumbnail={p.thumbnail}
                      images={p.images}
                      size="square"
                      className="!p-0 !rounded-none h-full w-full"
                    />
                  </LocalizedClientLink>

                  <div className="flex-1 min-w-0">
                    <div className="flex items-center justify-between gap-1">
                      <span className="text-[10px] font-bold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded">
                        {p.categories?.[0]?.name || "Supermercado"}
                      </span>
                      <span className="text-[10px] font-mono text-slate-500">
                        ║▌║ {info.barcode}
                      </span>
                    </div>

                    <LocalizedClientLink
                      href={`/products/${p.handle}`}
                      onClick={close}
                    >
                      <h4 className="font-extrabold text-slate-900 text-sm truncate mt-1 hover:text-emerald-700">
                        {p.title}
                      </h4>
                    </LocalizedClientLink>

                    <div className="grid grid-cols-2 gap-1.5 mt-2">
                      <button
                        type="button"
                        disabled={addingId === detalKey}
                        onClick={() =>
                          handleQuickAdd(info.detalVar?.id, detalKey)
                        }
                        className="px-2 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-500 text-white text-[11px] font-extrabold flex flex-col items-center leading-tight"
                      >
                        <span>
                          {addedId === detalKey
                            ? "✓ Agregado"
                            : "🛍️ + Al Detal"}
                        </span>
                        <span className="text-[10px] font-normal opacity-95">
                          {formatCOP(info.detalCop)}
                        </span>
                      </button>

                      {info.mayorVar && (
                        <button
                          type="button"
                          disabled={addingId === mayorKey}
                          onClick={() =>
                            handleQuickAdd(info.mayorVar?.id, mayorKey)
                          }
                          className="px-2 py-1.5 rounded-lg bg-amber-400 hover:bg-amber-300 text-slate-950 text-[11px] font-extrabold flex flex-col items-center leading-tight"
                        >
                          <span>
                            {addedId === mayorKey
                              ? "✓ Agregado"
                              : "📦 + Por Mayor"}
                          </span>
                          <span className="text-[10px] font-semibold">
                            {formatCOP(info.mayorCop)}
                          </span>
                        </button>
                      )}
                    </div>
                  </div>
                </div>
              )
            })
          )}
        </div>
      </SearchDrawer>
    </>
  )
}

export default Search
