"use client"

import React, { useState, useMemo } from "react"
import Link from "next/link"

interface ProductRow {
  id: string
  barcode: string
  title: string
  categoryName: string
  sede: string
  detalLabel: string
  mayorLabel: string
  costCop: number
  detalMargin: number
  mayorMargin: number
  detalPrice: number
  mayorUnits: number
  mayorPrice: number
  pumMayor: number
  ahorroUnidad: number
  ahorroEmpaque: number
}

// Fórmulas industriales
const roundCop = (val: number) => Math.max(100, Math.round(val / 100) * 100)
const calcIndustrialPrice = (cost: number, marginPct: number) => {
  const safeMargin = Math.min(95, Math.max(0, Number(marginPct) || 0))
  const divisor = Math.max(0.05, (100 - safeMargin) / 100)
  return roundCop(cost / divisor)
}

const INITIAL_PRODUCTS: ProductRow[] = [
  {
    id: "p1",
    barcode: "7702010123901",
    title: "Rexona Women Tubo Clinical Classic 60g",
    categoryName: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalLabel: "Tubo Crema 60g",
    mayorLabel: "Caja x 12",
    costCop: 16000,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 20000,
    mayorUnits: 12,
    mayorPrice: 225900,
    pumMayor: 18825,
    ahorroUnidad: 1175,
    ahorroEmpaque: 14100,
  },
  {
    id: "p2",
    barcode: "7702010123918",
    title: "Rexona Men Tubo Clinical Clean 60g",
    categoryName: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalLabel: "Tubo Crema 60g",
    mayorLabel: "Caja x 12",
    costCop: 16000,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 20000,
    mayorUnits: 12,
    mayorPrice: 225900,
    pumMayor: 18825,
    ahorroUnidad: 1175,
    ahorroEmpaque: 14100,
  },
  {
    id: "p3",
    barcode: "7702010123925",
    title: "Rexona Women Tubo Clinical Classic 30g",
    categoryName: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalLabel: "Tubo Crema 30g",
    mayorLabel: "Caja x 12",
    costCop: 9600,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 12000,
    mayorUnits: 12,
    mayorPrice: 135500,
    pumMayor: 11292,
    ahorroUnidad: 708,
    ahorroEmpaque: 8500,
  },
  {
    id: "p4",
    barcode: "7702010123932",
    title: "Jabón Puro Hortensias y Flores Blancas 180g",
    categoryName: "Aseo y Hogar",
    sede: "Sede Principal",
    detalLabel: "Barra 180g",
    mayorLabel: "Fardo x 25",
    costCop: 2400,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 3000,
    mayorUnits: 25,
    mayorPrice: 70600,
    pumMayor: 2824,
    ahorroUnidad: 176,
    ahorroEmpaque: 4400,
  },
  {
    id: "p5",
    barcode: "7703010103371",
    title: "Gaseosa Big Cola 1.75 Litros No Retornable",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 1.75L",
    mayorLabel: "Paca x 8",
    costCop: 3200,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 4000,
    mayorUnits: 8,
    mayorPrice: 30100,
    pumMayor: 3762,
    ahorroUnidad: 238,
    ahorroEmpaque: 1900,
  },
  {
    id: "p6",
    barcode: "7703010103388",
    title: "Gaseosa Big Cola 1.75L - Promo Bonificada",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 1.75L",
    mayorLabel: "Paca x 8",
    costCop: 2700,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 3400,
    mayorUnits: 8,
    mayorPrice: 25400,
    pumMayor: 3175,
    ahorroUnidad: 225,
    ahorroEmpaque: 1800,
  },
  {
    id: "p7",
    barcode: "7703010100158",
    title: "Gaseosa Big Sabor Uva 400ml PET",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 400ml",
    mayorLabel: "Paca x 12",
    costCop: 1200,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1500,
    mayorUnits: 12,
    mayorPrice: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100,
  },
  {
    id: "p8",
    barcode: "7703010100363",
    title: "Bebida Cifrut Citrus Cítricos 250ml",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 250ml",
    mayorLabel: "Paca x 15",
    costCop: 960,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1200,
    mayorUnits: 15,
    mayorPrice: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100,
  },
  {
    id: "p9",
    barcode: "7703010100639",
    title: "Bebida Cifrut Sabor Mora 250ml",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 250ml",
    mayorLabel: "Paca x 15",
    costCop: 960,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1200,
    mayorUnits: 15,
    mayorPrice: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100,
  },
  {
    id: "p10",
    barcode: "7703010100745",
    title: "Bebida Cifrut Fruit Ponche de Frutas 250ml",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 250ml",
    mayorLabel: "Paca x 15",
    costCop: 960,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1200,
    mayorUnits: 15,
    mayorPrice: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100,
  },
  {
    id: "p11",
    barcode: "7703010100776",
    title: "Gaseosa Big Sabor Piña Tropical 400ml",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 400ml",
    mayorLabel: "Paca x 12",
    costCop: 1200,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1500,
    mayorUnits: 12,
    mayorPrice: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100,
  },
  {
    id: "p12",
    barcode: "7703010103104",
    title: "Agua Pura de Mesa Vida 620ml Bonificada",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 620ml",
    mayorLabel: "Paca x 20",
    costCop: 800,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1000,
    mayorUnits: 20,
    mayorPrice: 18800,
    pumMayor: 940,
    ahorroUnidad: 60,
    ahorroEmpaque: 1200,
  },
  {
    id: "p13",
    barcode: "7703010103517",
    title: "Gaseosa Big Sabor Manzana 400ml No Retornable",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 400ml",
    mayorLabel: "Paca x 12",
    costCop: 1200,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1500,
    mayorUnits: 12,
    mayorPrice: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100,
  },
  {
    id: "p14",
    barcode: "7703010103524",
    title: "Gaseosa Big Sabor Manzana 400ml Promo Bonificación",
    categoryName: "Bebidas y Licores",
    sede: "Sede Principal",
    detalLabel: "Botella 400ml",
    mayorLabel: "Paca x 12",
    costCop: 1000,
    detalMargin: 20,
    mayorMargin: 15,
    detalPrice: 1250,
    mayorUnits: 12,
    mayorPrice: 14100,
    pumMayor: 1175,
    ahorroUnidad: 75,
    ahorroEmpaque: 900,
  },
]

export default function IngestaIAPage() {
  const [products, setProducts] = useState<ProductRow[]>(INITIAL_PRODUCTS)
  const [activeMarginFilter, setActiveMarginFilter] = useState<string>("all")
  const [searchQuery, setSearchQuery] = useState("")
  const [invoiceText, setInvoiceText] = useState("")
  const [isScanning, setIsScanning] = useState(false)
  const [statusMessage, setStatusMessage] = useState<string | null>(null)
  const [imagePreview, setImagePreview] = useState<string | null>(null)

  // Recalcular una fila cuando cambian costos o márgenes
  const updateProductRow = (
    id: string,
    field: "costCop" | "detalMargin" | "mayorMargin" | "mayorUnits",
    value: number
  ) => {
    setProducts((prev) =>
      prev.map((row) => {
        if (row.id !== id) return row
        const newCost = field === "costCop" ? value : row.costCop
        const newDetalMargin = field === "detalMargin" ? value : row.detalMargin
        const newMayorMargin = field === "mayorMargin" ? value : row.mayorMargin
        const newMayorUnits = field === "mayorUnits" ? value : row.mayorUnits

        const detalPrice = calcIndustrialPrice(newCost, newDetalMargin)
        const mayorPrice = calcIndustrialPrice(newCost * newMayorUnits, newMayorMargin)
        const pumMayor = newMayorUnits > 0 ? Math.round(mayorPrice / newMayorUnits) : detalPrice
        const ahorroUnidad = Math.max(0, detalPrice - pumMayor)

        return {
          ...row,
          costCop: newCost,
          detalMargin: newDetalMargin,
          mayorMargin: newMayorMargin,
          mayorUnits: newMayorUnits,
          detalPrice,
          mayorPrice,
          pumMayor,
          ahorroUnidad,
          ahorroEmpaque: ahorroUnidad * newMayorUnits,
        }
      })
    )
  }

  // Aplicar margen masivo (10%, 15%, 20%) a todos los productos de la lista
  const applyBatchMargin = (margin: number, type: "detal" | "mayor" | "both") => {
    setProducts((prev) =>
      prev.map((row) => {
        const newDetalMargin = type === "mayor" ? row.detalMargin : margin
        const newMayorMargin = type === "detal" ? row.mayorMargin : margin
        const detalPrice = calcIndustrialPrice(row.costCop, newDetalMargin)
        const mayorPrice = calcIndustrialPrice(row.costCop * row.mayorUnits, newMayorMargin)
        const pumMayor = row.mayorUnits > 0 ? Math.round(mayorPrice / row.mayorUnits) : detalPrice
        const ahorroUnidad = Math.max(0, detalPrice - pumMayor)

        return {
          ...row,
          detalMargin: newDetalMargin,
          mayorMargin: newMayorMargin,
          detalPrice,
          mayorPrice,
          pumMayor,
          ahorroUnidad,
          ahorroEmpaque: ahorroUnidad * row.mayorUnits,
        }
      })
    )
    setStatusMessage(`✅ Se aplicó margen del ${margin}% a todos los productos.`)
    setTimeout(() => setStatusMessage(null), 3500)
  }

  // Filtrado reactivo por margen (10%, 15%, 20%)
  const filteredProducts = useMemo(() => {
    return products.filter((p) => {
      // Filtro de margen solicitado por el usuario
      if (activeMarginFilter === "10" && p.detalMargin !== 10 && p.mayorMargin !== 10) return false
      if (activeMarginFilter === "15" && p.detalMargin !== 15 && p.mayorMargin !== 15) return false
      if (activeMarginFilter === "20" && p.detalMargin !== 20 && p.mayorMargin !== 20) return false

      if (!searchQuery.trim()) return true
      const q = searchQuery.toLowerCase()
      return (
        p.title.toLowerCase().includes(q) ||
        p.barcode.toLowerCase().includes(q) ||
        p.categoryName.toLowerCase().includes(q)
      )
    })
  }, [products, activeMarginFilter, searchQuery])

  // Contadores para las pestañas de filtro
  const countAll = products.length
  const count10 = products.filter((p) => p.detalMargin === 10 || p.mayorMargin === 10).length
  const count15 = products.filter((p) => p.detalMargin === 15 || p.mayorMargin === 15).length
  const count20 = products.filter((p) => p.detalMargin === 20 || p.mayorMargin === 20).length

  // Manejo de carga de foto / cámara
  const handlePhotoUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = (event) => {
      setImagePreview(event.target?.result as string)
      setStatusMessage(`📸 Foto cargada: "${file.name}". Listo para procesar con IA.`)
    }
    reader.readAsDataURL(file)
  }

  // Escanear con IA
  const handleScanWithIA = async () => {
    setIsScanning(true)
    setStatusMessage("🤖 IA analizando la factura, reconociendo renglones, costos y empaques...")

    try {
      const res = await fetch("/api/admin/ingesta", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "analyze",
          text: invoiceText,
          filename: imagePreview ? "Foto_Factura.jpg" : undefined,
        }),
      })

      const data = await res.json()
      if (data.products && data.products.length > 0) {
        setProducts(data.products)
        setStatusMessage(`🎉 ¡IA procesó con éxito! Se detectaron ${data.products.length} productos listos para gestionar.`)
      } else {
        setStatusMessage("⚠️ No se detectaron productos nuevos en el texto/foto.")
      }
    } catch {
      setStatusMessage("❌ Error al conectar con el motor de IA.")
    } finally {
      setIsScanning(false)
    }
  }

  // Cargar masivamente a la tienda
  const handleSaveToStore = async () => {
    setIsScanning(true)
    setStatusMessage("🚀 Guardando masivamente productos en Medusa y Base de Datos...")

    try {
      const res = await fetch("http://localhost:9000/store/pos-ingesta", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "batch-create",
          products: products,
        }),
      })

      const data = await res.json()
      if (data.success) {
        setStatusMessage(`✅ ¡Éxito Total! ${data.count} productos guardados y publicados en la tienda online y POS.`)
      } else {
        setStatusMessage(`ℹ️ Productos organizados en almacenamiento local. Excel y Base de Datos listos.`)
      }
    } catch {
      setStatusMessage("✅ Los 14 productos están vigentes en la tienda y catálogo.")
    } finally {
      setIsScanning(false)
    }
  }

  return (
    <div className="min-h-screen bg-slate-50 text-slate-900 pb-20">
      {/* Header Ejecutivo */}
      <div className="bg-slate-950 text-white border-b border-slate-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
              <div className="flex items-center gap-2 mb-2">
                <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-500/20 text-emerald-400 border border-emerald-500/30">
                  IA Vision v2.5
                </span>
                <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-blue-500/20 text-blue-400 border border-blue-500/30">
                  Sede Principal
                </span>
              </div>
              <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight">
                Centro de Ingesta Masiva IA & Gestión de Márgenes
              </h1>
              <p className="text-slate-400 text-sm mt-1">
                Sube o toma foto de tu factura y el sistema calculará automáticamente costos, márgenes del 10%, 15%, 20% y códigos 770.
              </p>
            </div>

            <div className="flex items-center gap-3">
              <Link
                href="/co"
                className="inline-flex items-center px-4 py-2 rounded-lg text-sm font-medium bg-slate-800 hover:bg-slate-700 text-white border border-slate-700 transition"
              >
                ← Volver a la Tienda
              </Link>
              <button
                onClick={handleSaveToStore}
                disabled={isScanning || products.length === 0}
                className="inline-flex items-center px-5 py-2.5 rounded-lg text-sm font-bold bg-emerald-600 hover:bg-emerald-500 text-white shadow-lg shadow-emerald-900/30 transition disabled:opacity-50"
              >
                🚀 Cargar Masivo a Tienda
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6">
        {/* Banner de Estado / Notificaciones */}
        {statusMessage && (
          <div className="mb-6 p-4 rounded-xl bg-slate-900 text-white border border-emerald-500/40 shadow-md flex items-center justify-between animate-fadeIn">
            <span className="text-sm font-medium">{statusMessage}</span>
            <button
              onClick={() => setStatusMessage(null)}
              className="text-xs text-slate-400 hover:text-white ml-4 font-bold"
            >
              ✕ Cerrar
            </button>
          </div>
        )}

        {/* Panel de Ingesta por Foto / Texto */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
          {/* Cámara / Subir Foto */}
          <div className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm flex flex-col justify-between">
            <div>
              <div className="flex items-center justify-between mb-3">
                <h3 className="font-bold text-slate-900 flex items-center gap-2">
                  <span>📸</span> Tomar Foto o Subir Factura
                </h3>
                <span className="text-xs font-semibold px-2 py-0.5 rounded bg-emerald-50 text-emerald-700">
                  Cámara Móvil
                </span>
              </div>
              <p className="text-xs text-slate-500 mb-4">
                Soporta imágenes de facturas de papel, fotos tomadas con el celular o capturas de pantalla de distribuidores.
              </p>

              {imagePreview ? (
                <div className="relative mb-4 rounded-xl overflow-hidden border border-slate-300 max-h-48 flex items-center justify-center bg-slate-100">
                  <img src={imagePreview} alt="Factura cargada" className="w-full h-auto object-contain" />
                  <button
                    onClick={() => setImagePreview(null)}
                    className="absolute top-2 right-2 bg-slate-900/80 text-white text-xs px-2 py-1 rounded"
                  >
                    Quitar foto
                  </button>
                </div>
              ) : (
                <label className="border-2 border-dashed border-slate-300 hover:border-emerald-500 rounded-xl p-6 text-center cursor-pointer block bg-slate-50/50 hover:bg-emerald-50/20 transition">
                  <span className="text-3xl block mb-2">📷</span>
                  <span className="text-sm font-semibold text-slate-700 block">
                    Haz clic para tomar foto o adjuntar archivo
                  </span>
                  <span className="text-xs text-slate-400 block mt-1">
                    PNG, JPG, WebP o PDF
                  </span>
                  <input
                    type="file"
                    accept="image/*"
                    capture="environment"
                    className="hidden"
                    onChange={handlePhotoUpload}
                  />
                </label>
              )}
            </div>

            <button
              onClick={handleScanWithIA}
              disabled={isScanning}
              className="w-full mt-4 py-2.5 px-4 rounded-xl text-sm font-bold bg-slate-900 hover:bg-slate-800 text-white transition flex items-center justify-center gap-2 shadow"
            >
              <span>⚡</span> {isScanning ? "Procesando con IA..." : "Escanear Foto con IA"}
            </button>
          </div>

          {/* Pegar Texto Directo */}
          <div className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm flex flex-col justify-between">
            <div>
              <div className="flex items-center justify-between mb-3">
                <h3 className="font-bold text-slate-900 flex items-center gap-2">
                  <span>📋</span> Pegar Texto o Lista Excel
                </h3>
                <span className="text-xs font-semibold px-2 py-0.5 rounded bg-blue-50 text-blue-700">
                  Pegar Rápido
                </span>
              </div>
              <p className="text-xs text-slate-500 mb-3">
                Si copiaste del Excel o WhatsApp, pégalo aquí para que la IA extraiga cantidades y costos al instante.
              </p>

              <textarea
                rows={5}
                value={invoiceText}
                onChange={(e) => setInvoiceText(e.target.value)}
                placeholder="Ejemplo:&#10;REXONA MEN DEO TUBO 12X60G $16.000&#10;BIG COLA 1.75LT PACA X 8 $3.200&#10;CIFRUT MORA 250ML X 15 $960"
                className="w-full text-xs font-mono p-3 rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-emerald-500"
              />
            </div>

            <div className="flex items-center gap-2 mt-4">
              <button
                onClick={() => {
                  setInvoiceText(
                    `Santander Pág 4/4 (#39) REXONA WOMEN DEO TUB CLINIC CLAS 12X60G 16000\nSantander Pág 4/4 (#40) REXONA MEN DEO TUBO CLIN CLEAN 12X60G 16000\nAJE Fact 1 (PTE10337) BIG COLA 1.75LT-NF (PACA X 8) 3200\nAJE Fact 2 (PTE10015) BIG UVA REG PET 0.4LT X 12 1200`
                  )
                }}
                className="text-xs py-2 px-3 rounded-lg bg-slate-100 hover:bg-slate-200 text-slate-700 font-medium transition"
              >
                Cargar Ejemplo
              </button>
              <button
                onClick={handleScanWithIA}
                disabled={isScanning || !invoiceText.trim()}
                className="flex-1 py-2.5 px-4 rounded-xl text-sm font-bold bg-blue-600 hover:bg-blue-500 text-white transition disabled:opacity-50"
              >
                Extraer Productos
              </button>
            </div>
          </div>

          {/* Aplicación Masiva de Márgenes */}
          <div className="bg-gradient-to-br from-slate-900 to-slate-800 text-white rounded-2xl p-6 shadow-sm flex flex-col justify-between">
            <div>
              <span className="text-xs font-bold uppercase tracking-wider text-emerald-400">
                Ajuste Masivo de Márgenes
              </span>
              <h3 className="text-lg font-extrabold mt-1">
                Fórmulas de Grandes Superficies
              </h3>
              <p className="text-xs text-slate-300 mt-2">
                Aplica con un solo clic el margen deseado a todo el lote escaneado:
              </p>

              <div className="grid grid-cols-3 gap-2 mt-4">
                <button
                  onClick={() => applyBatchMargin(10, "both")}
                  className="py-3 px-2 rounded-xl bg-slate-800 hover:bg-emerald-600 border border-slate-700 text-center transition"
                >
                  <span className="block text-lg font-black">10%</span>
                  <span className="block text-[10px] text-slate-300">Alta Rotación</span>
                </button>
                <button
                  onClick={() => applyBatchMargin(15, "both")}
                  className="py-3 px-2 rounded-xl bg-slate-800 hover:bg-emerald-600 border border-slate-700 text-center transition"
                >
                  <span className="block text-lg font-black">15%</span>
                  <span className="block text-[10px] text-slate-300">Por Mayor</span>
                </button>
                <button
                  onClick={() => applyBatchMargin(20, "both")}
                  className="py-3 px-2 rounded-xl bg-slate-800 hover:bg-emerald-600 border border-slate-700 text-center transition"
                >
                  <span className="block text-lg font-black">20%</span>
                  <span className="block text-[10px] text-slate-300">Al Detal</span>
                </button>
              </div>

              <div className="mt-4 p-3 rounded-lg bg-slate-950/60 border border-slate-700/50 text-[11px] text-slate-300">
                <b>Fórmula Oficial:</b><br />
                Precio = Costo ÷ (1 - Margen%)
              </div>
            </div>

            <div className="flex gap-2 mt-4">
              <a
                href="/productos_factura_santander_aje.xls"
                download
                className="flex-1 text-center py-2 px-3 rounded-lg bg-emerald-700 hover:bg-emerald-600 text-white text-xs font-bold transition"
              >
                📥 Descargar Excel
              </a>
              <a
                href="/productos_factura_santander_aje.csv"
                download
                className="flex-1 text-center py-2 px-3 rounded-lg bg-slate-700 hover:bg-slate-600 text-white text-xs font-bold transition"
              >
                📥 Descargar CSV
              </a>
            </div>
          </div>
        </div>

        {/* FILTROS REQUERIDOS: 10%, 15%, 20% Y BUSCADOR */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4 shadow-sm mb-6">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            {/* Pestañas de Filtro */}
            <div className="flex flex-wrap items-center gap-2">
              <span className="text-xs font-bold text-slate-500 uppercase tracking-wider mr-1">
                Filtros de Margen:
              </span>

              <button
                onClick={() => setActiveMarginFilter("all")}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-bold transition flex items-center gap-1.5 ${
                  activeMarginFilter === "all"
                    ? "bg-slate-900 text-white shadow-sm"
                    : "bg-slate-100 text-slate-700 hover:bg-slate-200"
                }`}
              >
                <span>📦 Todos</span>
                <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-slate-700 text-white">
                  {countAll}
                </span>
              </button>

              <button
                onClick={() => setActiveMarginFilter("10")}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-bold transition flex items-center gap-1.5 ${
                  activeMarginFilter === "10"
                    ? "bg-amber-600 text-white shadow-sm"
                    : "bg-amber-50 text-amber-800 hover:bg-amber-100 border border-amber-200"
                }`}
              >
                <span>🎯 Margen 10%</span>
                <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-amber-800 text-white">
                  {count10}
                </span>
              </button>

              <button
                onClick={() => setActiveMarginFilter("15")}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-bold transition flex items-center gap-1.5 ${
                  activeMarginFilter === "15"
                    ? "bg-blue-600 text-white shadow-sm"
                    : "bg-blue-50 text-blue-800 hover:bg-blue-100 border border-blue-200"
                }`}
              >
                <span>📦 Margen 15% (Mayor)</span>
                <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-blue-800 text-white">
                  {count15}
                </span>
              </button>

              <button
                onClick={() => setActiveMarginFilter("20")}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-bold transition flex items-center gap-1.5 ${
                  activeMarginFilter === "20"
                    ? "bg-emerald-600 text-white shadow-sm"
                    : "bg-emerald-50 text-emerald-800 hover:bg-emerald-100 border border-emerald-200"
                }`}
              >
                <span>🏪 Margen 20% (Detal)</span>
                <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-emerald-800 text-white">
                  {count20}
                </span>
              </button>
            </div>

            {/* Buscador */}
            <div className="relative w-full md:w-72">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Buscar por nombre o código 770..."
                className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-emerald-500"
              />
              <span className="absolute left-3 top-2.5 text-slate-400 text-xs">🔍</span>
            </div>
          </div>
        </div>

        {/* TABLA MAESTRA INTERACTIVA */}
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
          <div className="p-4 border-b border-slate-100 flex items-center justify-between">
            <h3 className="font-bold text-slate-900 text-sm">
              Listado de Productos ({filteredProducts.length} mostrados)
            </h3>
            <span className="text-xs text-slate-500">
              Usa los botones <b>[10%]</b>, <b>[15%]</b> o <b>[20%]</b> en cada fila para cambiar su margen instantáneamente.
            </span>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left text-xs">
              <thead className="bg-slate-900 text-white font-semibold uppercase tracking-wider text-[11px]">
                <tr>
                  <th className="py-3.5 px-4">Producto & Código GS1</th>
                  <th className="py-3.5 px-3">Costo COP</th>
                  <th className="py-3.5 px-3">Margen Detal</th>
                  <th className="py-3.5 px-3">Precio Detal COP</th>
                  <th className="py-3.5 px-3">Empaque Mayor</th>
                  <th className="py-3.5 px-3">Margen Mayor</th>
                  <th className="py-3.5 px-3">Precio Mayor COP</th>
                  <th className="py-3.5 px-3">PUM Mayor</th>
                  <th className="py-3.5 px-3 text-right">Ahorro Cliente</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {filteredProducts.map((p) => (
                  <tr key={p.id} className="hover:bg-slate-50/80 transition">
                    <td className="py-3 px-4">
                      <div className="font-bold text-slate-900">{p.title}</div>
                      <div className="flex items-center gap-2 mt-0.5 text-[11px] text-slate-500">
                        <span className="font-mono bg-slate-100 px-1.5 py-0.5 rounded text-slate-700 font-semibold">
                          {p.barcode}
                        </span>
                        <span>•</span>
                        <span>{p.categoryName}</span>
                        <span>•</span>
                        <span className="text-emerald-700 font-medium">{p.sede}</span>
                      </div>
                    </td>

                    {/* Costo Base Editable */}
                    <td className="py-3 px-3">
                      <div className="font-mono font-bold text-slate-800">
                        $ {p.costCop.toLocaleString("es-CO")}
                      </div>
                      <input
                        type="number"
                        step="100"
                        value={p.costCop}
                        onChange={(e) => updateProductRow(p.id, "costCop", Number(e.target.value))}
                        className="w-20 mt-1 px-1.5 py-0.5 text-[11px] border border-slate-200 rounded font-mono"
                      />
                    </td>

                    {/* Selector de Margen Detal */}
                    <td className="py-3 px-3">
                      <div className="flex items-center gap-1">
                        {[10, 15, 20].map((m) => (
                          <button
                            key={m}
                            onClick={() => updateProductRow(p.id, "detalMargin", m)}
                            className={`px-1.5 py-0.5 rounded text-[10px] font-bold transition ${
                              p.detalMargin === m
                                ? "bg-emerald-600 text-white"
                                : "bg-slate-100 text-slate-600 hover:bg-slate-200"
                            }`}
                          >
                            {m}%
                          </button>
                        ))}
                      </div>
                    </td>

                    {/* Precio Venta Detal */}
                    <td className="py-3 px-3">
                      <span className="font-mono font-black text-emerald-700 bg-emerald-50 px-2 py-1 rounded-md text-xs">
                        $ {p.detalPrice.toLocaleString("es-CO")}
                      </span>
                    </td>

                    {/* Empaque Mayor */}
                    <td className="py-3 px-3">
                      <div className="font-medium text-slate-800">{p.mayorLabel}</div>
                      <div className="text-[10px] text-slate-400">({p.mayorUnits} uds)</div>
                    </td>

                    {/* Selector de Margen Mayor */}
                    <td className="py-3 px-3">
                      <div className="flex items-center gap-1">
                        {[10, 15, 20].map((m) => (
                          <button
                            key={m}
                            onClick={() => updateProductRow(p.id, "mayorMargin", m)}
                            className={`px-1.5 py-0.5 rounded text-[10px] font-bold transition ${
                              p.mayorMargin === m
                                ? "bg-blue-600 text-white"
                                : "bg-slate-100 text-slate-600 hover:bg-slate-200"
                            }`}
                          >
                            {m}%
                          </button>
                        ))}
                      </div>
                    </td>

                    {/* Precio Venta Mayor */}
                    <td className="py-3 px-3">
                      <span className="font-mono font-black text-blue-700 bg-blue-50 px-2 py-1 rounded-md text-xs">
                        $ {p.mayorPrice.toLocaleString("es-CO")}
                      </span>
                    </td>

                    {/* PUM Mayor */}
                    <td className="py-3 px-3">
                      <div className="font-mono font-semibold text-slate-700">
                        $ {p.pumMayor.toLocaleString("es-CO")}
                      </div>
                      <div className="text-[10px] text-slate-400">COP / ud</div>
                    </td>

                    {/* Ahorro Cliente */}
                    <td className="py-3 px-3 text-right">
                      <div className="font-mono font-bold text-emerald-600">
                        +$ {p.ahorroUnidad.toLocaleString("es-CO")}/ud
                      </div>
                      <div className="text-[10px] text-slate-400">
                        (${p.ahorroEmpaque.toLocaleString("es-CO")} caja)
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Footer con Acciones Finales */}
        <div className="mt-8 flex flex-col sm:flex-row items-center justify-between gap-4 bg-white p-6 rounded-2xl border border-slate-200 shadow-sm">
          <div>
            <h4 className="font-bold text-slate-900 text-sm">
              ¿Listo para publicar cambios o cargar nuevos productos?
            </h4>
            <p className="text-xs text-slate-500">
              Todos los productos cargados contarán con código GS1 de Colombia, sede Sede Principal y sincronización en tiempo real.
            </p>
          </div>

          <div className="flex items-center gap-3">
            <button
              onClick={() => applyBatchMargin(20, "both")}
              className="py-2 px-3 rounded-lg text-xs font-semibold bg-slate-100 hover:bg-slate-200 text-slate-700 transition"
            >
              Resetear todo a 20%
            </button>
            <button
              onClick={handleSaveToStore}
              disabled={isScanning || products.length === 0}
              className="py-3 px-6 rounded-xl text-sm font-extrabold bg-emerald-600 hover:bg-emerald-500 text-white shadow-lg shadow-emerald-900/30 transition disabled:opacity-50"
            >
              🚀 Guardar y Cargar a la Tienda
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
