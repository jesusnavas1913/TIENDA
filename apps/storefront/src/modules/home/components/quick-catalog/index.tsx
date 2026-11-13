"use client"

import React, { useMemo, useState } from "react"
import { addToCart } from "@lib/data/cart"
import { notifyCartUpdated } from "@lib/util/cart-events"
import { HttpTypes } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import Thumbnail from "@modules/products/components/thumbnail"
import { useParams } from "next/navigation"

type SaleMode = "detal" | "mayor"

// Sub-filtros rápidos por departamento (lo que el usuario pidió: aceite, arroz, azúcar, café...)
const SUB_FILTERS: Record<
  string,
  { label: string; keywords: string[] }[]
> = {
  "Despensa y Abarrotes": [
    { label: "Todos los abarrotes", keywords: [] },
    { label: "🍚 Arroz", keywords: ["arroz", "diana", "roa"] },
    { label: "🌻 Aceite", keywords: ["aceite", "premier"] },
    { label: "🧂 Azúcar", keywords: ["azucar", "azúcar", "manuelita"] },
    { label: "☕ Café", keywords: ["cafe", "café", "sello rojo"] },
    { label: "🍫 Chocolate", keywords: ["chocolate", "corona"] },
    { label: "🫘 Frijol y Lentejas", keywords: ["frijol", "fríjol", "lenteja"] },
  ],
  "Frutas y Verduras": [
    { label: "Todas las verduras", keywords: [] },
    { label: "🥔 Papa", keywords: ["papa", "pastusa"] },
    { label: "🍅 Tomate", keywords: ["tomate", "chonto"] },
    { label: "🧅 Cebolla", keywords: ["cebolla", "cabezona"] },
    { label: "🍌 Plátano", keywords: ["platano", "plátano", "harton", "hartón"] },
    { label: "🥑 Aguacate", keywords: ["aguacate", "hass"] },
  ],
  "Carnes y Charcutería": [
    { label: "Todas las carnes", keywords: [] },
    { label: "🍗 Pollo / Pechuga", keywords: ["pollo", "pechuga"] },
    { label: "🥩 Res / Molida", keywords: ["res", "molida"] },
    { label: "🥓 Cerdo", keywords: ["cerdo", "lomo"] },
    { label: "🍖 Costilla", keywords: ["costilla", "sancocho"] },
  ],
  "Lácteos y Huevos": [
    { label: "Todos los lácteos", keywords: [] },
    { label: "🥚 Huevos", keywords: ["huevo", "santa anita", "aa"] },
    { label: "🥛 Leche", keywords: ["leche", "alqueria", "alquería", "colanta"] },
    { label: "🧀 Queso", keywords: ["queso", "campesino"] },
  ],
  "Aseo y Hogar": [
    { label: "Todo aseo", keywords: [] },
    { label: "🧴 Rexona (Desodorante)", keywords: ["rexona", "deo"] },
    { label: "🧼 Jabón Puro", keywords: ["puro", "jabón", "jabon"] },
    { label: "🧺 Detergente Ariel", keywords: ["detergente", "ariel"] },
    { label: "🧴 Clorox", keywords: ["clorox", "blanqueador"] },
  ],
  "Bebidas y Licores": [
    { label: "Todas las bebidas", keywords: [] },
    { label: "🥤 Big Cola", keywords: ["big cola", "cola"] },
    { label: "🍊 Cifrut", keywords: ["cifrut", "citrus", "mora", "fruit"] },
    { label: "🍺 Cerveza Águila", keywords: ["cerveza", "aguila", "águila"] },
    { label: "💧 Agua Vida", keywords: ["vida", "agua"] },
    { label: "🍎 Postobón Manzana", keywords: ["postobon", "postobón", "manzana"] },
  ],
  all: [
    { label: "Todos los productos", keywords: [] },
    { label: "🍚 Arroz", keywords: ["arroz"] },
    { label: "🌻 Aceite", keywords: ["aceite"] },
    { label: "🧂 Azúcar", keywords: ["azucar", "azúcar"] },
    { label: "☕ Café", keywords: ["cafe", "café"] },
    { label: "🥔 Papa / Verduras", keywords: ["papa", "tomate", "cebolla", "platano", "aguacate"] },
    { label: "🍗 Carnes y Pollo", keywords: ["pechuga", "res", "cerdo", "pollo", "costilla"] },
    { label: "🥚 Huevos y Leche", keywords: ["huevo", "leche", "queso"] },
    { label: "🧴 Aseo y Desodorantes", keywords: ["rexona", "jabón", "detergente", "clorox"] },
    { label: "🥤 Bebidas y Cerveza", keywords: ["big", "cifrut", "cerveza", "agua", "postobon"] },
  ],
}

export default function QuickSupermarketCatalog({
  products,
}: {
  products: HttpTypes.StoreProduct[]
}) {
  const [saleMode, setSaleMode] = useState<SaleMode>("detal")
  const [selectedCategory, setSelectedCategory] = useState<string>("all")
  const [selectedSubFilter, setSelectedSubFilter] = useState<string>("Todos")
  const [searchQuery, setSearchQuery] = useState<string>("")
  const [addingId, setAddingId] = useState<string | null>(null)
  const [addedId, setAddedId] = useState<string | null>(null)
  const [quantities, setQuantities] = useState<Record<string, number>>({})

  const countryCode = (useParams()?.countryCode as string) || "co"

  // Departamentos principales existentes
  const departmentList = [
    { id: "all", name: "Todos los Pasillos", emoji: "🛒" },
    { id: "Despensa y Abarrotes", name: "Abarrotes y Despensa", emoji: "🌾" },
    { id: "Frutas y Verduras", name: "Frutas y Verduras", emoji: "🥬" },
    { id: "Carnes y Charcutería", name: "Carnes y Pollería", emoji: "🥩" },
    { id: "Lácteos y Huevos", name: "Lácteos y Huevos", emoji: "🥛" },
    { id: "Aseo y Hogar", name: "Aseo y Hogar", emoji: "🧼" },
    { id: "Bebidas y Licores", name: "Bebidas y Licores", emoji: "🥤" },
  ]

  // Subfiltros disponibles para la categoría activa
  const currentSubFilters = SUB_FILTERS[selectedCategory] || SUB_FILTERS["all"]

  // Cuando cambia la categoría principal, resetear el subfiltro
  const handleSelectCategory = (catId: string) => {
    setSelectedCategory(catId)
    setSelectedSubFilter(SUB_FILTERS[catId]?.[0]?.label || "Todos")
  }

  // Filtrado reactivo de productos
  const filteredProducts = useMemo(() => {
    return products.filter((p) => {
      // 1. Filtro por categoría principal
      if (selectedCategory !== "all") {
        const matchesCat = p.categories?.some(
          (c) =>
            c.name?.toLowerCase().includes(selectedCategory.toLowerCase()) ||
            selectedCategory.toLowerCase().includes(c.name?.toLowerCase() || "")
        )
        if (!matchesCat) return false
      }

      // 2. Sub-filtro específico (aceite, arroz, azúcar, café, papa, etc.)
      const activeSub = currentSubFilters.find((sf) => sf.label === selectedSubFilter)
      if (activeSub && activeSub.keywords.length > 0) {
        const titleLower = p.title.toLowerCase()
        const matchesSub = activeSub.keywords.some((kw) => titleLower.includes(kw))
        if (!matchesSub) return false
      }

      // 3. Buscador de texto
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase()
        const titleMatch = p.title.toLowerCase().includes(q)
        const barcodeMatch = (p.metadata as any)?.barcode?.toLowerCase().includes(q)
        if (!titleMatch && !barcodeMatch) return false
      }

      return true
    })
  }, [products, selectedCategory, selectedSubFilter, searchQuery, currentSubFilters])

  // Obtener precios formateados de variante Detal o Mayor
  const getProductPricing = (product: HttpTypes.StoreProduct) => {
    const variants = product.variants || []
    const detalVar =
      variants.find(
        (v) =>
          v.title?.toLowerCase().includes("detal") ||
          v.sku?.toUpperCase().startsWith("DETAL")
      ) || variants[0]
    const mayorVar =
      variants.find(
        (v) =>
          v.title?.toLowerCase().includes("mayor") ||
          v.sku?.toUpperCase().startsWith("MAYOR")
      ) || variants[1] || variants[0]

    const getCop = (v: any, fallback = 3000) => {
      const calc = v?.calculated_price
      if (calc?.calculated_amount != null) {
        return calc.calculated_amount
      }
      const p = v?.prices?.find((x: any) => x.currency_code?.toLowerCase() === "cop")
      return p?.amount || fallback
    }

    const detalPrice = getCop(detalVar, 3000)
    const mayorPrice = getCop(mayorVar, 30000)
    const meta = (product.metadata || {}) as any
    const mayorUnits = Math.max(1, Number(meta.mayor_units || 10))
    const pumMayor = Math.round(mayorPrice / mayorUnits)
    const ahorroUnidad = Math.max(0, detalPrice - pumMayor)

    return {
      detalVar,
      mayorVar,
      detalPrice,
      mayorPrice,
      detalLabel: meta.detal_label || "Unidad",
      mayorLabel: meta.mayor_label || `Empaque x ${mayorUnits}`,
      mayorUnits,
      pumMayor,
      ahorroUnidad,
      activePrice: saleMode === "mayor" ? mayorPrice : detalPrice,
      activeLabel: saleMode === "mayor" ? meta.mayor_label || `Empaque x ${mayorUnits}` : meta.detal_label || "Unidad",
      activeVariant: saleMode === "mayor" ? mayorVar : detalVar,
    }
  }

  // Manejo de Carrito
  const changeQty = (id: string, delta: number) => {
    setQuantities((prev) => ({
      ...prev,
      [id]: Math.max(1, Math.min(99, (prev[id] || 1) + delta)),
    }))
  }

  const handleAddToCart = async (product: HttpTypes.StoreProduct) => {
    const pricing = getProductPricing(product)
    if (!pricing.activeVariant?.id) return

    setAddingId(product.id)
    const qty = quantities[product.id] || 1

    try {
      await addToCart({
        variantId: pricing.activeVariant.id,
        quantity: qty,
        countryCode,
      })
      notifyCartUpdated()
      setAddedId(product.id)
      setTimeout(() => setAddedId(null), 2000)
    } catch {
      // Carrito local
    } finally {
      setAddingId(null)
    }
  }

  return (
    <section id="catalogo-rapido" className="content-container py-6">
      {/* 1. BARRA SUPERIOR MINIMALISTA: BUSCADOR + SELECTOR DETAL/MAYOR */}
      <div className="flex flex-col sm:flex-row items-center justify-between gap-3 mb-5">
        {/* Buscador Rápido */}
        <div className="relative w-full sm:w-80">
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="🔍 Buscar arroz, aceite, papa, carne, leche..."
            className="w-full pl-9 pr-4 py-2 text-xs sm:text-sm rounded-xl border border-slate-200 bg-white focus:outline-none focus:ring-2 focus:ring-emerald-500 shadow-sm"
          />
          <span className="absolute left-3 top-2.5 text-slate-400 text-xs">🔍</span>
          {searchQuery && (
            <button
              onClick={() => setSearchQuery("")}
              className="absolute right-3 top-2 text-xs text-slate-400 hover:text-slate-600"
            >
              ✕
            </button>
          )}
        </div>

        {/* Switch Limpio Detal / Mayor */}
        <div className="flex items-center gap-1.5 p-1 bg-slate-100 rounded-xl border border-slate-200 text-xs font-bold w-full sm:w-auto justify-center">
          <button
            type="button"
            onClick={() => setSaleMode("detal")}
            className={`px-4 py-1.5 rounded-lg transition-all flex items-center gap-1.5 ${
              saleMode === "detal"
                ? "bg-white text-emerald-800 shadow-sm font-black"
                : "text-slate-600 hover:text-slate-900"
            }`}
          >
            <span>🛍️ Al Detal</span>
            <span className="text-[10px] text-slate-400 font-normal">(Unidad)</span>
          </button>
          <button
            type="button"
            onClick={() => setSaleMode("mayor")}
            className={`px-4 py-1.5 rounded-lg transition-all flex items-center gap-1.5 ${
              saleMode === "mayor"
                ? "bg-amber-400 text-slate-950 shadow-sm font-black"
                : "text-slate-600 hover:text-slate-900"
            }`}
          >
            <span>📦 Al por Mayor</span>
            <span className="text-[10px] text-amber-900 font-semibold">(-15%)</span>
          </button>
        </div>
      </div>

      {/* 2. BARRA DE DEPARTAMENTOS / PASILLOS (SENCILLA Y MINIMALISTA) */}
      <div className="flex items-center gap-2 overflow-x-auto pb-2 mb-3 scrollbar-none">
        {departmentList.map((dep) => {
          const isSelected = selectedCategory === dep.id
          return (
            <button
              key={dep.id}
              type="button"
              onClick={() => handleSelectCategory(dep.id)}
              className={`px-3.5 py-2 rounded-xl text-xs font-extrabold whitespace-nowrap transition-all flex items-center gap-1.5 shrink-0 ${
                isSelected
                  ? "bg-slate-900 text-white shadow-sm ring-1 ring-slate-900"
                  : "bg-white text-slate-700 hover:bg-slate-100 border border-slate-200"
              }`}
            >
              <span>{dep.emoji}</span>
              <span>{dep.name}</span>
            </button>
          )
        })}
      </div>

      {/* 3. SUB-FILTROS ESPECÍFICOS (LO QUE EL USUARIO PIDIÓ: ACEITE, ARROZ, AZÚCAR, CAFÉ...) */}
      <div className="bg-slate-50 border border-slate-200/80 rounded-2xl p-2.5 mb-6">
        <div className="flex items-center gap-1.5 overflow-x-auto scrollbar-none">
          <span className="text-[11px] font-bold text-slate-500 uppercase tracking-wider pl-1 pr-2 shrink-0">
            Filtros rápidos:
          </span>
          {currentSubFilters.map((sf) => {
            const isSelected = selectedSubFilter === sf.label
            return (
              <button
                key={sf.label}
                type="button"
                onClick={() => setSelectedSubFilter(sf.label)}
                className={`px-3 py-1 rounded-lg text-xs font-bold whitespace-nowrap transition-all shrink-0 ${
                  isSelected
                    ? "bg-emerald-600 text-white shadow-sm"
                    : "bg-white text-slate-700 hover:bg-slate-200 border border-slate-200"
                }`}
              >
                {sf.label}
              </button>
            )
          })}
        </div>
      </div>

      {/* Contador Limpio de Resultados */}
      <div className="flex items-center justify-between text-xs text-slate-500 mb-4 px-1">
        <span>
          Mostrando <b>{filteredProducts.length} productos</b> disponibles en Sede Principal
        </span>
        <span className="text-[11px] text-slate-400">
          Modalidad activa: <b>{saleMode === "mayor" ? "Por Mayor (Caja / Bulto)" : "Al Detal (Unidad)"}</b>
        </span>
      </div>

      {/* 4. CUADRÍCULA DE PRODUCTOS (MINIMALISTA, LIMPIA Y ELEGANTE) */}
      {filteredProducts.length === 0 ? (
        <div className="text-center py-16 bg-white rounded-2xl border border-slate-200 p-8">
          <span className="text-4xl block mb-2">🔍</span>
          <h3 className="text-base font-bold text-slate-800">No encontramos productos con ese filtro</h3>
          <p className="text-xs text-slate-500 mt-1">Prueba seleccionando otro producto o limpiando la búsqueda.</p>
          <button
            onClick={() => {
              setSelectedCategory("all")
              setSelectedSubFilter("Todos")
              setSearchQuery("")
            }}
            className="mt-4 px-4 py-2 bg-slate-900 text-white rounded-xl text-xs font-bold hover:bg-slate-800"
          >
            Ver todos los 38 productos
          </button>
        </div>
      ) : (
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3 sm:gap-4">
          {filteredProducts.map((p) => {
            const pricing = getProductPricing(p)
            const qty = quantities[p.id] || 1
            const isAdding = addingId === p.id
            const isAdded = addedId === p.id

            return (
              <div
                key={p.id}
                className="bg-white rounded-2xl border border-slate-200 hover:border-slate-300 hover:shadow-md transition-all p-3 sm:p-4 flex flex-col justify-between"
              >
                <div>
                  {/* Foto de Producto Limpia */}
                  <LocalizedClientLink href={`/products/${p.handle}`}>
                    <div className="aspect-square w-full rounded-xl overflow-hidden bg-slate-50 mb-3 relative group">
                      <Thumbnail
                        thumbnail={p.thumbnail}
                        images={p.images}
                        alt={p.title}
                        size="full"
                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                      />
                      {saleMode === "mayor" ? (
                        <span className="absolute top-2 left-2 bg-amber-400 text-slate-950 text-[10px] font-black px-2 py-0.5 rounded-md shadow-sm">
                          📦 MAYOR ({pricing.mayorUnits} uds)
                        </span>
                      ) : (
                        <span className="absolute top-2 left-2 bg-emerald-600 text-white text-[10px] font-black px-2 py-0.5 rounded-md shadow-sm">
                          🛍️ DETAL
                        </span>
                      )}
                    </div>
                  </LocalizedClientLink>

                  {/* Nombre y Presentación */}
                  <LocalizedClientLink href={`/products/${p.handle}`}>
                    <h3 className="font-extrabold text-xs sm:text-sm text-slate-900 hover:text-emerald-700 transition line-clamp-2 leading-snug">
                      {p.title}
                    </h3>
                  </LocalizedClientLink>

                  <div className="text-[11px] text-slate-500 mt-1">
                    {pricing.activeLabel}
                  </div>
                </div>

                {/* Precios y Botón Agregar */}
                <div className="mt-3 pt-3 border-t border-slate-100">
                  <div className="flex items-baseline justify-between gap-1 mb-2">
                    <div>
                      <div className="font-mono text-base sm:text-lg font-black text-slate-900 leading-tight">
                        $ {pricing.activePrice.toLocaleString("es-CO")}
                        <span className="text-[10px] font-normal text-slate-400 ml-1">COP</span>
                      </div>
                      {saleMode === "mayor" && pricing.ahorroUnidad > 0 && (
                        <div className="text-[10px] text-emerald-700 font-bold">
                          ${pricing.pumMayor.toLocaleString("es-CO")}/ud • Ahorras ${pricing.ahorroUnidad.toLocaleString("es-CO")}
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Controles de Cantidad y Agregar al Carrito */}
                  <div className="flex items-center gap-1.5">
                    <div className="flex items-center border border-slate-200 rounded-lg bg-slate-50 h-8">
                      <button
                        type="button"
                        onClick={() => changeQty(p.id, -1)}
                        className="w-7 h-full flex items-center justify-center text-slate-600 hover:bg-slate-200 text-xs font-bold"
                      >
                        −
                      </button>
                      <span className="w-6 text-center text-xs font-bold text-slate-900">
                        {qty}
                      </span>
                      <button
                        type="button"
                        onClick={() => changeQty(p.id, 1)}
                        className="w-7 h-full flex items-center justify-center text-slate-600 hover:bg-slate-200 text-xs font-bold"
                      >
                        +
                      </button>
                    </div>

                    <button
                      type="button"
                      disabled={isAdding}
                      onClick={() => handleAddToCart(p)}
                      className={`flex-1 h-8 rounded-lg text-xs font-black transition flex items-center justify-center gap-1 shadow-sm ${
                        isAdded
                          ? "bg-emerald-800 text-white"
                          : saleMode === "mayor"
                          ? "bg-amber-400 hover:bg-amber-300 text-slate-950"
                          : "bg-emerald-600 hover:bg-emerald-500 text-white"
                      }`}
                    >
                      {isAdding ? "..." : isAdded ? "✓ Listo" : "Agregar"}
                    </button>
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      )}
    </section>
  )
}
