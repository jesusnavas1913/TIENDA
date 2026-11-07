import { defineRouteConfig } from "@medusajs/admin-sdk"
import { TagSolid } from "@medusajs/icons"
import {
  Badge,
  Button,
  Container,
  Heading,
  Input,
  Select,
  Table,
  Text,
  Textarea,
  toast,
} from "@medusajs/ui"
import { useEffect, useMemo, useRef, useState } from "react"

const roundCop = (val: number) => Math.max(100, Math.round(val))

// Fórmula Grandes Industrias (Margen Bruto Comercial sobre Precio de Venta):
// Precio Venta = Costo / (1 - %/100)
// Ej: 20% -> Costo / 0.80 | 15% -> Costo / 0.85 | 30% -> Costo / 0.70
const getIndustrialDivisor = (marginPct: number) => {
  const safe = Math.min(95, Math.max(-90, Number(marginPct) || 0))
  return Math.max(0.05, (100 - safe) / 100)
}

const calcIndustrialPrice = (
  cost: number,
  marginPct: number,
  discountPct = 0
) => {
  const divisor = getIndustrialDivisor(marginPct)
  const discFactor = Math.max(0.1, 1 - (Number(discountPct) || 0) / 100)
  return roundCop((cost / divisor) * discFactor)
}

const calcIndustrialMarginFromPrice = (cost: number, price: number) => {
  if (!price || price <= 0 || cost <= 0) return 0
  return Math.round((1 - cost / price) * 100)
}

const formatCop = (val: number) =>
  `$ ${Math.round(val || 0).toLocaleString("es-CO")}`

const COLOMBIAN_SEDES = [
  "Todas las Sedes",
  "Bogotá - Corabastos",
  "Medellín - Mayorista",
  "Cali - Cavasa",
  "Barranquilla - Centro",
]

// Built-in Colombian GS1 770 Dictionary so scanning or typing common barcodes auto-fills the product!
const COLOMBIAN_BARCODE_DICTIONARY: Record<
  string,
  {
    title: string
    costCop: number
    detalLabel: string
    mayorLabel: string
    mayorUnits: number
    imageUrl: string
  }
> = {
  "7702001051001": {
    title: "Arroz Diana Premium Grano Entero",
    costCop: 3800,
    detalLabel: "Bolsa x 1kg",
    mayorLabel: "Paca Mayorista x 25kg",
    mayorUnits: 25,
    imageUrl:
      "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80",
  },
  "7702004003502": {
    title: "Café Sello Rojo Tradicional Colombiano",
    costCop: 16500,
    detalLabel: "Bolsa x 500g",
    mayorLabel: "Paca x 12 Bolsas",
    mayorUnits: 12,
    imageUrl:
      "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80",
  },
  "7702129001009": {
    title: "Leche Alquería Entera Larga Vida",
    costCop: 4200,
    detalLabel: "Bolsa x 1.1L",
    mayorLabel: "Paca x 12 Bolsas",
    mayorUnits: 12,
    imageUrl:
      "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80",
  },
  "7702025102004": {
    title: "Aceite Premier Puro Girasol",
    costCop: 22000,
    detalLabel: "Botella x 1000ml",
    mayorLabel: "Caja x 12 Botellas",
    mayorUnits: 12,
    imageUrl:
      "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80",
  },
}

const POSBarcodeManagerPage = () => {
  const [products, setProducts] = useState<any[]>([])
  const [categories, setCategories] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState("")
  const [savingId, setSavingId] = useState<string | null>(null)
  const [showCreateModal, setShowCreateModal] = useState(false)
  const [editingProduct, setEditingProduct] = useState<any | null>(null)

  // Fast POS Scanner Bar States (1-Line Entry)
  const barcodeInputRef = useRef<HTMLInputElement>(null)
  const [fastBarcode, setFastBarcode] = useState("")
  const [fastTitle, setFastTitle] = useState("")
  const [fastCostCop, setFastCostCop] = useState("5000")
  const [fastDetalPct, setFastDetalPct] = useState("20")
  const [fastMayorPct, setFastMayorPct] = useState("15")
  const [fastMayorUnits, setFastMayorUnits] = useState("10")
  // 5000 / 0.80 = 6250 | (5000 * 10) / 0.85 = 58824
  const [fastDetalPrice, setFastDetalPrice] = useState("6250")
  const [fastMayorPrice, setFastMayorPrice] = useState("58824")
  const [fastCategoryId, setFastCategoryId] = useState("")
  const [fastSede, setFastSede] = useState("Todas las Sedes")
  const [fastStockQty, setFastStockQty] = useState("150")
  const [fastImageUrl, setFastImageUrl] = useState("")
  const [fastSaving, setFastSaving] = useState(false)
  const [fastMatchedProduct, setFastMatchedProduct] = useState<any | null>(null)

  // Auto-save & Sede organization states
  const [selectedSedeFilter, setSelectedSedeFilter] = useState<string>("all")
  const [autoSaveEnabled, setAutoSaveEnabled] = useState<boolean>(true)
  const [autoSaveStatus, setAutoSaveStatus] = useState<string>(
    "✅ Auto-guardado activo"
  )
  const autoSaveTimerRef = useRef<any>(null)

  // Global / Bulk Percentage States (Default standard: 20% Detal, 15% Mayor)
  const [targetScope, setTargetScope] = useState<string>("all")
  const [globalDetalMargin, setGlobalDetalMargin] = useState<string>("20")
  const [globalMayorMargin, setGlobalMayorMargin] = useState<string>("15")
  const [globalDiscount, setGlobalDiscount] = useState<string>("0")
  const [globalPriceAdjust, setGlobalPriceAdjust] = useState<string>("")
  const [applyingBulk, setApplyingBulk] = useState(false)

  // Individual inline percentage overrides per row
  const [rowEdits, setRowEdits] = useState<
    Record<
      string,
      {
        costCop: number
        detalPct: number
        mayorPct: number
        mayorUnits: number
        discountPct: number
        detalPrice: number
        mayorPrice: number
        sede: string
        stockQty: number
      }
    >
  >({})

  // Form states for Full Edit Modal
  const [formTitle, setFormTitle] = useState("")
  const [formBarcode, setFormBarcode] = useState("")
  const [formImage, setFormImage] = useState("")
  const [formDescription, setFormDescription] = useState("")
  const [formCategoryId, setFormCategoryId] = useState("")
  const [formSede, setFormSede] = useState("Todas las Sedes")
  const [formStockQty, setFormStockQty] = useState("150")
  const [formCostCop, setFormCostCop] = useState("5000")
  const [formDetalMargin, setFormDetalMargin] = useState("20")
  const [formMayorMargin, setFormMayorMargin] = useState("15")
  const [formMayorUnits, setFormMayorUnits] = useState("10")
  const [formDiscountPct, setFormDiscountPct] = useState("0")
  const [formDetalPrice, setFormDetalPrice] = useState("6250")
  const [formMayorPrice, setFormMayorPrice] = useState("58824")
  const [formDetalLabel, setFormDetalLabel] = useState("Unidad x 1kg")
  const [formMayorLabel, setFormMayorLabel] = useState("Caja Mayorista x 10kg")

  const loadData = async () => {
    setLoading(true)
    try {
      const res = await fetch("/admin/pos-manager", {
        credentials: "include",
      })
      const json = await res.json()
      setProducts(json.products || [])
      setCategories(json.categories || [])
      const firstCat = json.categories?.[0]?.id || ""
      if (firstCat && !formCategoryId) setFormCategoryId(firstCat)
      if (firstCat && !fastCategoryId) setFastCategoryId(firstCat)
      setRowEdits({})
    } catch {
      toast.error("Error cargando el catálogo POS")
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  const generateColombianBarcode = () => {
    const randomDigits = Math.floor(1000000000 + Math.random() * 9000000000)
    return `770${randomDigits}`
  }

  const getProductDetails = (p: any) => {
    const variants = p.variants || []
    const detalVar =
      variants.find(
        (v: any) =>
          v.title?.toLowerCase().includes("detal") ||
          v.sku?.toUpperCase().startsWith("DETAL")
      ) || variants[0]
    const mayorVar =
      variants.find(
        (v: any) =>
          v.title?.toLowerCase().includes("mayor") ||
          v.sku?.toUpperCase().startsWith("MAYOR")
      ) || variants[1]

    const getCopPrice = (v: any) => {
      const cop = v?.prices?.find(
        (pr: any) => pr.currency_code?.toLowerCase() === "cop"
      )
      return cop?.amount ?? v?.prices?.[0]?.amount ?? 5000
    }

    const detalPrice = getCopPrice(detalVar)
    const mayorPrice = getCopPrice(mayorVar)
    const meta = p.metadata || {}

    const detalPct =
      meta.detal_margin_pct !== undefined
        ? Number(meta.detal_margin_pct)
        : 20
    const costCop =
      Number(meta.cost_cop) ||
      roundCop(detalPrice * getIndustrialDivisor(detalPct))
    const mayorUnits = Number(meta.mayor_units) || 10
    const mayorPct =
      meta.mayor_margin_pct !== undefined
        ? Number(meta.mayor_margin_pct)
        : 15
    const discountPct = Number(meta.discount_pct || 0)

    const barcode =
      meta.barcode ||
      detalVar?.barcode ||
      detalVar?.ean ||
      `77000${p.id.slice(-8).replace(/\D/g, "4")}`

    return {
      barcode,
      costCop,
      detalPct,
      mayorPct,
      mayorUnits,
      discountPct,
      detalPrice,
      mayorPrice,
      detalLabel: meta.detal_label || "Unidad",
      mayorLabel: meta.mayor_label || "Caja Mayorista",
      categoryName: p.categories?.[0]?.name || "Sin Categoría",
      categoryId: p.categories?.[0]?.id || "",
      sede: meta.sede || "Todas las Sedes",
      stockQty: meta.stock_qty !== undefined ? Number(meta.stock_qty) : 150,
    }
  }

  // Helper to load any product directly into the top Barcode Editor Bar
  const loadProductIntoBarcodeBar = (p: any) => {
    const info = getProductDetails(p)
    setFastMatchedProduct(p)
    setFastBarcode(info.barcode)
    setFastTitle(p.title || "")
    setFastCostCop(String(info.costCop))
    setFastDetalPct(String(info.detalPct))
    setFastMayorPct(String(info.mayorPct))
    setFastMayorUnits(String(info.mayorUnits))
    setFastDetalPrice(String(info.detalPrice))
    setFastMayorPrice(String(info.mayorPrice))
    if (info.categoryId) setFastCategoryId(info.categoryId)
    setFastSede(info.sede || "Todas las Sedes")
    setFastStockQty(String(info.stockQty ?? 150))
    setFastImageUrl(p.thumbnail || p.images?.[0]?.url || "")
    window.scrollTo({ top: 0, behavior: "smooth" })
    toast.info(`✏️ Modo Editar por Código activado: ${info.barcode} - ${p.title}`)
  }

  const clearFastBarcodeBar = () => {
    setFastMatchedProduct(null)
    setFastBarcode("")
    setFastTitle("")
    setFastImageUrl("")
    setFastCostCop("5000")
    setFastDetalPct("20")
    setFastMayorPct("15")
    setFastMayorUnits("10")
    setFastDetalPrice("6250")
    setFastMayorPrice("58824")
    setFastStockQty("150")
    barcodeInputRef.current?.focus()
  }

  // Fast Bar auto-calc when cost or % changes using Grandes Industrias formula: Costo / (1 - %/100)
  const recalcFastBar = (
    cStr: string,
    dPctStr: string,
    mPctStr: string,
    uStr: string
  ) => {
    const cost = Number(cStr) || 0
    const dPct = Number(dPctStr) || 0
    const mPct = Number(mPctStr) || 0
    const units = Math.max(1, Number(uStr) || 10)
    if (cost > 0) {
      setFastDetalPrice(String(calcIndustrialPrice(cost, dPct, 0)))
      setFastMayorPrice(String(calcIndustrialPrice(cost * units, mPct, 0)))
    }
  }

  // When user types or scans a barcode in Fast Bar, check if it exists in store or GS1 dictionary
  const handleFastBarcodeChange = (val: string) => {
    setFastBarcode(val)
    const clean = val.trim()
    if (!clean) {
      setFastMatchedProduct(null)
      return
    }

    // 1. Check if product already exists in store -> Switch to MODO EDITAR POR CÓDIGO!
    const existing = products.find((p) => {
      const info = getProductDetails(p)
      return info.barcode === clean
    })
    if (existing) {
      const info = getProductDetails(existing)
      setFastMatchedProduct(existing)
      setFastTitle(existing.title || "")
      setFastCostCop(String(info.costCop))
      setFastDetalPct(String(info.detalPct))
      setFastMayorPct(String(info.mayorPct))
      setFastMayorUnits(String(info.mayorUnits))
      setFastDetalPrice(String(info.detalPrice))
      setFastMayorPrice(String(info.mayorPrice))
      if (info.categoryId) setFastCategoryId(info.categoryId)
      setFastSede(info.sede || "Todas las Sedes")
      setFastStockQty(String(info.stockQty ?? 150))
      setFastImageUrl(existing.thumbnail || existing.images?.[0]?.url || "")
      toast.info(
        `✏️ MODO EDITAR POR CÓDIGO: "${existing.title}" (${clean}) cargado automáticamente.`
      )
      return
    }

    setFastMatchedProduct(null)

    // 2. Check built-in Colombian GS1 dictionary
    const preset = COLOMBIAN_BARCODE_DICTIONARY[clean]
    if (preset) {
      setFastTitle(preset.title)
      setFastCostCop(String(preset.costCop))
      setFastMayorUnits(String(preset.mayorUnits))
      setFastImageUrl(preset.imageUrl)
      recalcFastBar(
        String(preset.costCop),
        fastDetalPct,
        fastMayorPct,
        String(preset.mayorUnits)
      )
      toast.success(`¡Código 770 reconocido: ${preset.title}!`)
    }
  }

  const handleFastBarSubmit = async (e?: React.FormEvent) => {
    if (e) e.preventDefault()
    if (!fastTitle.trim()) {
      toast.error("Escribe el nombre del producto")
      return
    }

    const finalBc = fastBarcode.trim() || generateColombianBarcode()
    setFastSaving(true)
    setAutoSaveStatus("⏳ Guardando código en base de datos...")
    try {
      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: fastMatchedProduct ? "update" : "create",
          productId: fastMatchedProduct?.id,
          barcode: finalBc,
          title: fastTitle.trim(),
          categoryId: fastCategoryId || categories[0]?.id,
          sede: fastSede,
          stockQty: Number(fastStockQty || 150),
          costCop: Number(fastCostCop),
          detalMarginPct: Number(fastDetalPct),
          mayorMarginPct: Number(fastMayorPct),
          mayorUnits: Number(fastMayorUnits),
          detalPriceCop: Number(fastDetalPrice),
          mayorPriceCop: Number(fastMayorPrice),
          imageUrl: fastImageUrl.trim() || undefined,
          detalLabel: "Unidad Estándar",
          mayorLabel: `Caja Mayorista x ${fastMayorUnits} uds`,
        }),
      })

      if (!res.ok) throw new Error("Error guardando producto rápido")

      const timeStr = new Date().toLocaleTimeString("es-CO")
      setAutoSaveStatus(`✅ Guardado: "${fastTitle}" (${finalBc}) a las ${timeStr}`)
      toast.success(
        fastMatchedProduct
          ? `✅ Código ${finalBc} ("${fastTitle}") actualizado en ${fastSede}`
          : `✅ Nuevo producto "${fastTitle}" (${finalBc}) creado en ${fastSede}`
      )
      // Reset fast bar for next barcode scan immediately!
      clearFastBarcodeBar()
      await loadData()
    } catch {
      toast.error("Error al ingresar/actualizar producto por código")
      setAutoSaveStatus("⚠️ Error al guardar")
    } finally {
      setFastSaving(false)
    }
  }

  // Handle local computer image file upload -> base64 Data URL
  const handleFileUpload = (
    e: React.ChangeEvent<HTMLInputElement>,
    target: "fast" | "modal"
  ) => {
    const file = e.target.files?.[0]
    if (!file) return
    const reader = new FileReader()
    reader.onload = () => {
      if (typeof reader.result === "string") {
        if (target === "fast") setFastImageUrl(reader.result)
        else setFormImage(reader.result)
        toast.success("📷 Fotografía cargada desde tu equipo")
      }
    }
    reader.readAsDataURL(file)
  }

  const recalculateModalPrices = (
    costStr: string,
    dPctStr: string,
    mPctStr: string,
    unitsStr: string,
    discStr: string
  ) => {
    const cost = Number(costStr) || 0
    const dPct = Number(dPctStr) || 0
    const mPct = Number(mPctStr) || 0
    const units = Math.max(1, Number(unitsStr) || 10)
    const disc = Math.min(90, Math.max(0, Number(discStr) || 0))

    if (cost > 0) {
      const dPrice = calcIndustrialPrice(cost, dPct, disc)
      const mPrice = calcIndustrialPrice(cost * units, mPct, disc)
      setFormDetalPrice(String(dPrice))
      setFormMayorPrice(String(mPrice))
    }
  }

  const openEditModal = (p: any) => {
    const info = getProductDetails(p)
    setEditingProduct(p)
    setFormTitle(p.title || "")
    setFormBarcode(info.barcode)
    setFormImage(p.thumbnail || p.images?.[0]?.url || "")
    setFormDescription(p.description || "")
    setFormCategoryId(info.categoryId || categories[0]?.id || "")
    setFormSede(info.sede || "Todas las Sedes")
    setFormStockQty(String(info.stockQty ?? 150))
    setFormCostCop(String(info.costCop))
    setFormDetalMargin(String(info.detalPct))
    setFormMayorMargin(String(info.mayorPct))
    setFormMayorUnits(String(info.mayorUnits))
    setFormDiscountPct(String(info.discountPct))
    setFormDetalPrice(String(info.detalPrice))
    setFormMayorPrice(String(info.mayorPrice))
    setFormDetalLabel(info.detalLabel)
    setFormMayorLabel(info.mayorLabel)
    setShowCreateModal(true)
  }

  const handleSaveProduct = async () => {
    if (!formTitle.trim()) {
      toast.error("Ingresa el nombre del producto")
      return
    }
    setSavingId(editingProduct ? editingProduct.id : "new")
    try {
      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: editingProduct ? "update" : "create",
          productId: editingProduct?.id,
          title: formTitle,
          description: formDescription,
          imageUrl: formImage,
          categoryId: formCategoryId,
          sede: formSede,
          stockQty: Number(formStockQty || 150),
          barcode: formBarcode || generateColombianBarcode(),
          costCop: Number(formCostCop),
          detalMarginPct: Number(formDetalMargin),
          mayorMarginPct: Number(formMayorMargin),
          mayorUnits: Number(formMayorUnits),
          discountPct: Number(formDiscountPct),
          detalPriceCop: Number(formDetalPrice),
          mayorPriceCop: Number(formMayorPrice),
          detalLabel: formDetalLabel,
          mayorLabel: formMayorLabel,
        }),
      })

      if (!res.ok) throw new Error("Error al guardar")

      toast.success("¡Producto actualizado correctamente!")
      setShowCreateModal(false)
      await loadData()
    } catch {
      toast.error("No se pudo guardar el producto")
    } finally {
      setSavingId(null)
    }
  }

  // Auto-save helper: saves row automatically after 850ms of typing so user doesn't lose work
  const scheduleRowAutoSave = (p: any, nextEdit: any) => {
    if (!autoSaveEnabled) return
    setAutoSaveStatus(`⏳ Auto-guardando "${p.title}"...`)
    if (autoSaveTimerRef.current) clearTimeout(autoSaveTimerRef.current)
    autoSaveTimerRef.current = setTimeout(async () => {
      try {
        const res = await fetch("/admin/pos-manager", {
          method: "POST",
          credentials: "include",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            action: "update",
            productId: p.id,
            costCop: nextEdit.costCop,
            detalMarginPct: nextEdit.detalPct,
            mayorMarginPct: nextEdit.mayorPct,
            mayorUnits: nextEdit.mayorUnits,
            discountPct: nextEdit.discountPct,
            detalPriceCop: nextEdit.detalPrice,
            mayorPriceCop: nextEdit.mayorPrice,
            sede: nextEdit.sede,
            stockQty: nextEdit.stockQty,
          }),
        })
        if (res.ok) {
          const timeStr = new Date().toLocaleTimeString("es-CO")
          setAutoSaveStatus(
            `✅ Auto-guardado: "${p.title}" (${timeStr})`
          )
        }
      } catch {
        setAutoSaveStatus("⚠️ Error en auto-guardado")
      }
    }, 850)
  }

  const updateRowField = (
    p: any,
    field: "costCop" | "detalPct" | "mayorPct" | "discountPct",
    value: number
  ) => {
    const base = rowEdits[p.id] || getProductDetails(p)
    const next = { ...base, [field]: value }
    // Fórmula Grandes Industrias: Precio = Costo / (1 - %/100)
    next.detalPrice = calcIndustrialPrice(
      next.costCop,
      next.detalPct,
      next.discountPct || 0
    )
    next.mayorPrice = calcIndustrialPrice(
      next.costCop * next.mayorUnits,
      next.mayorPct,
      next.discountPct || 0
    )
    setRowEdits((prev) => ({ ...prev, [p.id]: next }))
    scheduleRowAutoSave(p, next)
  }

  const updateRowManualPrice = (
    p: any,
    field: "detalPrice" | "mayorPrice",
    priceValue: number
  ) => {
    const base = rowEdits[p.id] || getProductDetails(p)
    const next = { ...base, [field]: priceValue }
    if (next.costCop > 0 && priceValue > 0) {
      if (field === "detalPrice") {
        // Fórmula Inversa Grandes Industrias: % = (1 - Costo / Precio) * 100
        next.detalPct = calcIndustrialMarginFromPrice(next.costCop, priceValue)
      } else {
        const boxCost = next.costCop * (next.mayorUnits || 10)
        next.mayorPct = calcIndustrialMarginFromPrice(boxCost, priceValue)
      }
    }
    setRowEdits((prev) => ({ ...prev, [p.id]: next }))
    scheduleRowAutoSave(p, next)
  }

  const updateRowSedeOrStock = (
    p: any,
    field: "sede" | "stockQty",
    val: string | number
  ) => {
    const base = rowEdits[p.id] || getProductDetails(p)
    const next = { ...base, [field]: val }
    setRowEdits((prev) => ({ ...prev, [p.id]: next }))
    scheduleRowAutoSave(p, next)
  }

  const handleSaveRowPercentage = async (p: any) => {
    const edit = rowEdits[p.id]
    if (!edit) return
    setSavingId(p.id)
    try {
      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "update",
          productId: p.id,
          costCop: edit.costCop,
          detalMarginPct: edit.detalPct,
          mayorMarginPct: edit.mayorPct,
          mayorUnits: edit.mayorUnits,
          discountPct: edit.discountPct,
          detalPriceCop: edit.detalPrice,
          mayorPriceCop: edit.mayorPrice,
          sede: edit.sede,
          stockQty: edit.stockQty,
        }),
      })
      if (!res.ok) throw new Error("Error")
      toast.success(`¡Precios y Sede de "${p.title}" guardados!`)
      await loadData()
    } catch {
      toast.error("Error guardando cambios")
    } finally {
      setSavingId(null)
    }
  }

  const handleApplyGlobalPercentages = async (mode: "margins" | "adjust") => {
    setApplyingBulk(true)
    try {
      const payload: any = {
        action: "bulk-percentage",
        targetScope,
        targetSede: selectedSedeFilter,
      }
      if (mode === "adjust") {
        payload.globalPriceAdjustPct = Number(globalPriceAdjust || 0)
      } else {
        payload.globalDetalMarginPct = Number(globalDetalMargin)
        payload.globalMayorMarginPct = Number(globalMayorMargin)
        payload.globalDiscountPct = Number(globalDiscount || 0)
      }

      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      })
      const json = await res.json()
      toast.success(
        `¡Porcentaje Global aplicado a ${json.updatedCount || "todos los"} productos!`
      )
      await loadData()
    } catch {
      toast.error("Error aplicando porcentaje global")
    } finally {
      setApplyingBulk(false)
    }
  }

  const handleDelete = async (productId: string, title: string) => {
    if (!confirm(`¿Seguro que deseas eliminar "${title}"?`)) return
    setSavingId(productId)
    try {
      await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ action: "delete", productId }),
      })
      toast.success("Producto eliminado")
      await loadData()
    } catch {
      toast.error("Error eliminando producto")
    } finally {
      setSavingId(null)
    }
  }

  const filteredProducts = useMemo(() => {
    return products.filter((p) => {
      const matchesCat =
        targetScope === "all" ||
        p.categories?.some((c: any) => c.id === targetScope)
      if (!matchesCat) return false

      const info = rowEdits[p.id] || getProductDetails(p)
      const matchesSede =
        selectedSedeFilter === "all" ||
        info.sede === selectedSedeFilter ||
        info.sede === "Todas las Sedes"
      if (!matchesSede) return false

      if (!search.trim()) return true
      const q = search.toLowerCase()
      return (
        p.title?.toLowerCase().includes(q) ||
        info.barcode?.toLowerCase().includes(q) ||
        info.categoryName?.toLowerCase().includes(q) ||
        info.sede?.toLowerCase().includes(q)
      )
    })
  }, [products, search, targetScope, selectedSedeFilter, rowEdits])

  // Industrial KPI Summary across filtered catalog
  const industrialKpis = useMemo(() => {
    let totalCost = 0
    let totalDetalRev = 0
    let totalMayorBoxCost = 0
    let totalMayorRev = 0

    filteredProducts.forEach((p) => {
      const info = rowEdits[p.id] || getProductDetails(p)
      totalCost += info.costCop
      totalDetalRev += info.detalPrice
      totalMayorBoxCost += info.costCop * (info.mayorUnits || 10)
      totalMayorRev += info.mayorPrice
    })

    const detalProfit = totalDetalRev - totalCost
    const mayorProfit = totalMayorRev - totalMayorBoxCost
    const avgDetalMargin =
      totalDetalRev > 0
        ? Math.round((1 - totalCost / totalDetalRev) * 100)
        : 20
    const avgMayorMargin =
      totalMayorRev > 0
        ? Math.round((1 - totalMayorBoxCost / totalMayorRev) * 100)
        : 15

    return {
      skuCount: filteredProducts.length,
      totalCost,
      totalDetalRev,
      detalProfit,
      avgDetalMargin,
      totalMayorRev,
      mayorProfit,
      avgMayorMargin,
    }
  }, [filteredProducts, rowEdits])

  // Save all edited rows in 1 click
  const handleSaveAllEditedRows = async () => {
    const editedIds = Object.keys(rowEdits)
    if (editedIds.length === 0) return
    setApplyingBulk(true)
    try {
      for (const pid of editedIds) {
        const edit = rowEdits[pid]
        await fetch("/admin/pos-manager", {
          method: "POST",
          credentials: "include",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            action: "update",
            productId: pid,
            costCop: edit.costCop,
            detalMarginPct: edit.detalPct,
            mayorMarginPct: edit.mayorPct,
            mayorUnits: edit.mayorUnits,
            discountPct: edit.discountPct,
            detalPriceCop: edit.detalPrice,
            mayorPriceCop: edit.mayorPrice,
          }),
        })
      }
      toast.success(
        `✅ Se guardaron los ${editedIds.length} productos modificados`
      )
      await loadData()
    } catch {
      toast.error("Error guardando cambios múltiples")
    } finally {
      setApplyingBulk(false)
    }
  }

  // Export catalog to Excel CSV (with UTF-8 BOM for Spanish & accents)
  const handleExportExcelCsv = () => {
    const headers = [
      "Codigo_Barras_GS1_770",
      "Producto",
      "Categoria",
      "Costo_Base_COP",
      "Margen_Detal_%",
      "Divisor_Industrial_Detal",
      "Precio_Venta_Detal_COP",
      "Ganancia_Neta_Detal_COP",
      "Unidades_Caja_Mayor",
      "Margen_Mayor_%",
      "Divisor_Industrial_Mayor",
      "Precio_Venta_Mayor_COP",
      "PUM_Precio_Unidad_En_Mayor_COP",
      "Ganancia_Neta_Caja_Mayor_COP",
    ]

    const rows = filteredProducts.map((p) => {
      const base = getProductDetails(p)
      const cur = rowEdits[p.id] || base
      const dDiv = getIndustrialDivisor(cur.detalPct).toFixed(2)
      const mDiv = getIndustrialDivisor(cur.mayorPct).toFixed(2)
      const dProfit = cur.detalPrice - cur.costCop
      const mProfit = cur.mayorPrice - cur.costCop * cur.mayorUnits
      const pum = Math.round(cur.mayorPrice / Math.max(1, cur.mayorUnits))

      return [
        `"${base.barcode}"`,
        `"${(p.title || "").replace(/"/g, '""')}"`,
        `"${base.categoryName}"`,
        cur.costCop,
        cur.detalPct,
        dDiv,
        cur.detalPrice,
        dProfit,
        cur.mayorUnits,
        cur.mayorPct,
        mDiv,
        cur.mayorPrice,
        pum,
        mProfit,
      ].join(";")
    })

    const csvContent = "\uFEFF" + [headers.join(";"), ...rows].join("\n")
    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" })
    const url = URL.createObjectURL(blob)
    const link = document.createElement("a")
    link.href = url
    link.setAttribute(
      "download",
      `Catalogo_Industrial_SuperExpress_${new Date().toISOString().slice(0, 10)}.csv`
    )
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
    toast.success("📥 Catálogo exportado para Excel (.CSV)")
  }

  // Print Shelf Barcode Labels (Etiquetas de Góndola Estilo Supermercado / Makro)
  const handlePrintShelfLabels = () => {
    const win = window.open("", "_blank", "width=950,height=700")
    if (!win) {
      toast.error("Permite las ventanas emergentes para imprimir etiquetas")
      return
    }
    const cardsHtml = filteredProducts
      .map((p) => {
        const base = getProductDetails(p)
        const cur = rowEdits[p.id] || base
        const pum = Math.round(cur.mayorPrice / Math.max(1, cur.mayorUnits))
        return `
        <div class="label-card">
          <div class="cat">${base.categoryName.toUpperCase()} • SÚPER EXPRESS COLOMBIA</div>
          <div class="title">${p.title}</div>
          <div class="prices">
            <div class="detal-box">
              <div class="tag">PRECIO AL DETAL (${base.detalLabel})</div>
              <div class="price-big">$ ${cur.detalPrice.toLocaleString("es-CO")}</div>
            </div>
            <div class="mayor-box">
              <div class="tag">PRECIO MAYORISTA (x${cur.mayorUnits} uds)</div>
              <div class="price-mid">$ ${cur.mayorPrice.toLocaleString("es-CO")}</div>
              <div class="pum">PUM: Sale a $ ${pum.toLocaleString("es-CO")} / ud</div>
            </div>
          </div>
          <div class="barcode-wrap">
            <div class="bars">║▌║█║▌│║▌║▌█║▌║█║▌│║▌║</div>
            <div class="code">${base.barcode}</div>
          </div>
        </div>`
      })
      .join("")

    win.document.write(`
      <html>
        <head>
          <title>Etiquetas de Góndola GS1-770 - Súper Express Colombia</title>
          <style>
            body { font-family: Arial, sans-serif; padding: 16px; background: #f8fafc; }
            .toolbar { margin-bottom: 16px; display: flex; justify-content: space-between; align-items: center; background: #064e3b; color: white; padding: 12px 18px; border-radius: 10px; }
            .btn { background: #fbbf24; color: #0f172a; font-weight: 900; border: none; padding: 10px 18px; border-radius: 8px; cursor: pointer; font-size: 14px; }
            .grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 14px; }
            .label-card { background: white; border: 2px solid #0f172a; border-radius: 10px; padding: 12px; page-break-inside: avoid; }
            .cat { font-size: 10px; font-weight: bold; color: #047857; letter-spacing: 0.5px; }
            .title { font-size: 15px; font-weight: 900; color: #0f172a; margin: 4px 0 8px; }
            .prices { display: grid; grid-template-columns: 1fr 1fr; gap: 8px; border-top: 1px dashed #cbd5e1; border-bottom: 1px dashed #cbd5e1; padding: 8px 0; }
            .detal-box { background: #ecfdf5; padding: 6px 8px; border-radius: 6px; border: 1px solid #a7f3d0; }
            .mayor-box { background: #fffbeb; padding: 6px 8px; border-radius: 6px; border: 1px solid #fde68a; }
            .tag { font-size: 9px; font-weight: 800; color: #475569; }
            .price-big { font-size: 20px; font-weight: 900; color: #065f46; }
            .price-mid { font-size: 17px; font-weight: 900; color: #92400e; }
            .pum { font-size: 10px; font-weight: 800; color: #b45309; margin-top: 2px; }
            .barcode-wrap { text-align: center; margin-top: 8px; font-family: monospace; }
            .bars { font-size: 18px; letter-spacing: 3px; font-weight: bold; }
            .code { font-size: 12px; font-weight: bold; letter-spacing: 2px; }
            @media print { .toolbar { display: none; } body { background: white; padding: 0; } }
          </style>
        </head>
        <body>
          <div class="toolbar">
            <div>
              <strong>🖨️ ETIQUETAS DE GÓNDOLA Y ESTANTERÍA (GS1 COLOMBIA 770 + PUM)</strong>
              <div style="font-size:12px;opacity:0.85;">Incluye Precio Detal, Precio Mayorista y Precio por Unidad de Medida (Ley SIC Colombia)</div>
            </div>
            <button class="btn" onclick="window.print()">🖨️ Imprimir Etiquetas Ahora</button>
          </div>
          <div class="grid">${cardsHtml}</div>
        </body>
      </html>
    `)
    win.document.close()
  }

  return (
    <div className="flex flex-col gap-y-6 p-4">
      {/* EXECUTIVE INDUSTRIAL KPI BAR */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <Container className="p-4 border-l-4 border-l-slate-800 bg-ui-bg-base">
          <Text className="text-xs font-bold text-ui-fg-subtle uppercase">
            📦 Catálogo & Acciones Industriales
          </Text>
          <div className="text-2xl font-extrabold mt-1">
            {industrialKpis.skuCount} Referencias (SKUs)
          </div>
          <div className="flex flex-wrap gap-1.5 mt-3">
            <Button
              variant="secondary"
              size="small"
              type="button"
              onClick={handleExportExcelCsv}
            >
              📥 Exportar Excel/CSV
            </Button>
            <Button
              variant="secondary"
              size="small"
              type="button"
              onClick={handlePrintShelfLabels}
            >
              🖨️ Etiquetas Góndola
            </Button>
          </div>
        </Container>

        <Container className="p-4 border-l-4 border-l-blue-600 bg-ui-bg-base">
          <Text className="text-xs font-bold text-ui-fg-subtle uppercase">
            💵 Suma Costo Base (1 Ud c/u)
          </Text>
          <div className="text-2xl font-extrabold mt-1">
            {formatCop(industrialKpis.totalCost)} COP
          </div>
          <Text className="text-xs text-ui-fg-subtle mt-1">
            Base sobre la cual se divide entre <strong>0.80</strong> (Detal) y{" "}
            <strong>0.85</strong> (Mayor)
          </Text>
        </Container>

        <Container className="p-4 border-l-4 border-l-emerald-600 bg-ui-bg-base">
          <Text className="text-xs font-bold text-emerald-700 uppercase">
            🛍️ Rentabilidad Al Detal (Prom. {industrialKpis.avgDetalMargin}% → ÷
            {getIndustrialDivisor(industrialKpis.avgDetalMargin).toFixed(2)})
          </Text>
          <div className="text-2xl font-extrabold text-emerald-700 mt-1">
            +{formatCop(industrialKpis.detalProfit)} COP
          </div>
          <Text className="text-xs text-ui-fg-subtle mt-1">
            Venta total 1 ud c/u: {formatCop(industrialKpis.totalDetalRev)} COP
          </Text>
        </Container>

        <Container className="p-4 border-l-4 border-l-amber-500 bg-ui-bg-base">
          <Text className="text-xs font-bold text-amber-700 uppercase">
            🏭 Rentabilidad Mayorista (Prom. {industrialKpis.avgMayorMargin}% → ÷
            {getIndustrialDivisor(industrialKpis.avgMayorMargin).toFixed(2)})
          </Text>
          <div className="text-2xl font-extrabold text-amber-700 mt-1">
            +{formatCop(industrialKpis.mayorProfit)} COP
          </div>
          <Text className="text-xs text-ui-fg-subtle mt-1">
            Venta total 1 caja c/u: {formatCop(industrialKpis.totalMayorRev)} COP
          </Text>
        </Container>
      </div>
      {/* SEDE / BRANCH ORGANIZATION BAR + LIVE AUTO-SAVE INDICATOR */}
      <Container className="p-4 border bg-ui-bg-subtle">
        <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-3">
          <div>
            <div className="flex items-center gap-2 mb-1.5">
              <Text className="text-xs font-extrabold uppercase text-ui-fg-base">
                🏢 Organización por Sede (Sucursales Colombia):
              </Text>
              <Badge color="purple">{autoSaveStatus}</Badge>
            </div>
            <div className="flex flex-wrap gap-1.5">
              <Button
                variant={selectedSedeFilter === "all" ? "primary" : "secondary"}
                size="small"
                type="button"
                onClick={() => setSelectedSedeFilter("all")}
              >
                🌎 Ver Todas ({products.length})
              </Button>
              {COLOMBIAN_SEDES.filter((s) => s !== "Todas las Sedes").map(
                (sedeName) => {
                  const countInSede = products.filter((p) => {
                    const s =
                      (rowEdits[p.id] || getProductDetails(p)).sede ||
                      "Todas las Sedes"
                    return s === sedeName || s === "Todas las Sedes"
                  }).length
                  return (
                    <Button
                      key={sedeName}
                      variant={
                        selectedSedeFilter === sedeName
                          ? "primary"
                          : "secondary"
                      }
                      size="small"
                      type="button"
                      onClick={() => setSelectedSedeFilter(sedeName)}
                    >
                      🏢 {sedeName} ({countInSede})
                    </Button>
                  )
                }
              )}
            </div>
          </div>

          <div className="flex items-center gap-3 bg-ui-bg-base px-3.5 py-2 rounded-xl border shrink-0">
            <label className="flex items-center gap-2 cursor-pointer text-xs font-bold">
              <input
                type="checkbox"
                checked={autoSaveEnabled}
                onChange={(e) => {
                  setAutoSaveEnabled(e.target.checked)
                  setAutoSaveStatus(
                    e.target.checked
                      ? "✅ Auto-guardado activo (guarda mientras escribes)"
                      : "⏸️ Auto-guardado pausado (modo manual)"
                  )
                }}
              />
              ⚡ Auto-Guardado en Vivo (Guarda solo al escribir)
            </label>
          </div>
        </div>
      </Container>

      {/* FAST 1-LINE BARCODE ENTRY & EDIT-BY-BARCODE SCANNER */}
      <Container
        className={`p-6 border-2 bg-ui-bg-base shadow-md ${
          fastMatchedProduct ? "border-amber-500" : "border-emerald-600"
        }`}
      >
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-2 mb-4">
          <div>
            <div className="flex flex-wrap items-center gap-2 mb-1">
              {fastMatchedProduct ? (
                <Badge color="orange">
                  ✏️ MODO EDITAR POR CÓDIGO ACTIVO: {fastBarcode}
                </Badge>
              ) : (
                <Badge color="green">
                  ➕ MODO METER PRODUCTO NUEVO POR CÓDIGO 770
                </Badge>
              )}
              <Badge color="blue">
                🏭 FÓRMULA GRANDES INDUSTRIAS: 20% = Costo ÷ 0.80 | 15% = Costo ÷ 0.85
              </Badge>
            </div>
            <Heading level="h1" className="text-xl font-bold">
              {fastMatchedProduct
                ? `✏️ Editando por Código "${fastMatchedProduct.title}" (${fastBarcode}) — Modifica y pulsa Enter`
                : "Pistola POS: Escanea o Escribe el Código 770 → Asigna Sede y Costo → Enter para Guardar"}
            </Heading>
            <Text className="text-xs text-ui-fg-subtle">
              Si escribes o escaneas un código que ya existe, entra automáticamente en{" "}
              <strong>Modo Editar por Código</strong>. Si es nuevo, lo crea en la Sede elegida.
            </Text>
          </div>

          <div className="flex flex-wrap gap-1.5 items-center">
            {fastMatchedProduct && (
              <Button
                variant="secondary"
                size="small"
                type="button"
                onClick={clearFastBarcodeBar}
              >
                🔄 Salir de Edición / Nuevo Código
              </Button>
            )}
            {Object.entries(COLOMBIAN_BARCODE_DICTIONARY).map(([code, item]) => (
              <Button
                key={code}
                variant="secondary"
                size="small"
                type="button"
                onClick={() => handleFastBarcodeChange(code)}
              >
                🔫 {item.title.split(" ").slice(0, 2).join(" ")} ({code.slice(-4)})
              </Button>
            ))}
          </div>
        </div>

        <form
          onSubmit={handleFastBarSubmit}
          className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-12 gap-3 items-end bg-ui-bg-subtle p-4 rounded-xl border"
        >
          <div className="lg:col-span-2">
            <Text className="text-xs font-bold mb-1">
              1️⃣ Código 770 (Buscar/Meter)
            </Text>
            <div className="flex gap-1">
              <Input
                ref={barcodeInputRef}
                value={fastBarcode}
                onChange={(e) => handleFastBarcodeChange(e.target.value)}
                placeholder="Escanea 770..."
                autoFocus
              />
              <Button
                variant="secondary"
                type="button"
                onClick={() => handleFastBarcodeChange(generateColombianBarcode())}
                title="Generar código 770 automático"
              >
                🎲
              </Button>
            </div>
          </div>

          <div className="lg:col-span-2">
            <Text className="text-xs font-bold mb-1">
              2️⃣ Nombre del Producto *
            </Text>
            <Input
              value={fastTitle}
              onChange={(e) => setFastTitle(e.target.value)}
              placeholder="Ej: Aceite Premier x 1000ml"
            />
          </div>

          <div className="lg:col-span-2">
            <Text className="text-xs font-bold mb-1">3️⃣ Sede / Sucursal</Text>
            <Select
              value={fastSede}
              onValueChange={(val) => setFastSede(val)}
            >
              <Select.Trigger>
                <Select.Value placeholder="Sede" />
              </Select.Trigger>
              <Select.Content>
                {COLOMBIAN_SEDES.map((s) => (
                  <Select.Item key={s} value={s}>
                    🏢 {s}
                  </Select.Item>
                ))}
              </Select.Content>
            </Select>
          </div>

          <div className="lg:col-span-2">
            <Text className="text-xs font-bold mb-1">4️⃣ Categoría</Text>
            <Select
              value={fastCategoryId}
              onValueChange={(val) => setFastCategoryId(val)}
            >
              <Select.Trigger>
                <Select.Value placeholder="Categoría" />
              </Select.Trigger>
              <Select.Content>
                {categories.map((c) => (
                  <Select.Item key={c.id} value={c.id}>
                    {c.name}
                  </Select.Item>
                ))}
              </Select.Content>
            </Select>
          </div>

          <div className="lg:col-span-1">
            <Text className="text-xs font-bold mb-1">5️⃣ Costo ($)</Text>
            <Input
              type="number"
              value={fastCostCop}
              onChange={(e) => {
                setFastCostCop(e.target.value)
                recalcFastBar(
                  e.target.value,
                  fastDetalPct,
                  fastMayorPct,
                  fastMayorUnits
                )
              }}
            />
          </div>

          <div className="lg:col-span-1">
            <Text className="text-xs font-bold mb-1">
              🛍️ Detal (÷{getIndustrialDivisor(Number(fastDetalPct)).toFixed(2)})
            </Text>
            <Input
              type="number"
              value={fastDetalPrice}
              onChange={(e) => setFastDetalPrice(e.target.value)}
              title="Precio Al Detal (Costo ÷ 0.80 para 20%, o edítalo manual)"
            />
          </div>

          <div className="lg:col-span-1">
            <Text className="text-xs font-bold mb-1">
              📦 Mayor (÷{getIndustrialDivisor(Number(fastMayorPct)).toFixed(2)})
            </Text>
            <Input
              type="number"
              value={fastMayorPrice}
              onChange={(e) => setFastMayorPrice(e.target.value)}
              title="Precio Mayorista (Costo Caja ÷ 0.85 para 15%, o edítalo manual)"
            />
          </div>

          <div className="lg:col-span-1 flex gap-1 items-center">
            <label
              className="cursor-pointer px-2 py-2 rounded-lg border bg-ui-bg-base hover:bg-ui-bg-base-hover text-xs font-bold shrink-0"
              title="Subir foto desde tu computador"
            >
              📷
              <input
                type="file"
                accept="image/*"
                className="hidden"
                onChange={(e) => handleFileUpload(e, "fast")}
              />
            </label>
            <Button
              variant="primary"
              type="submit"
              isLoading={fastSaving}
              className="w-full"
            >
              {fastMatchedProduct ? "💾 Guardar" : "➕ Meter"}
            </Button>
          </div>
        </form>
      </Container>

      {/* GLOBAL PERCENTAGE ENGINE PANEL */}
      <Container className="p-5 border bg-ui-bg-subtle">
        <div className="flex flex-col gap-4">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
            <div>
              <Heading level="h2" className="text-base font-bold">
                📊 Motor de Porcentajes Globales (20% Detal y 15% Mayor por defecto)
              </Heading>
              <Text className="text-xs text-ui-fg-subtle">
                Aplica porcentajes en bloque a toda la tienda o filtra por un departamento específico.
              </Text>
            </div>

            <div className="w-full sm:w-72">
              <Select
                value={targetScope}
                onValueChange={(val) => setTargetScope(val)}
              >
                <Select.Trigger>
                  <Select.Value placeholder="Seleccionar alcance" />
                </Select.Trigger>
                <Select.Content>
                  <Select.Item value="all">
                    🌎 Toda la Tienda ({products.length} productos)
                  </Select.Item>
                  {categories.map((c) => (
                    <Select.Item key={c.id} value={c.id}>
                      📁 Solo Categoría: {c.name}
                    </Select.Item>
                  ))}
                </Select.Content>
              </Select>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 pt-2 border-t">
            <div className="lg:col-span-7 grid grid-cols-1 sm:grid-cols-4 gap-3 items-end bg-ui-bg-base p-3.5 rounded-xl border">
              <div>
                <Text className="text-xs font-bold mb-1">
                  🛍️ % Ganancia Detal (÷{getIndustrialDivisor(Number(globalDetalMargin)).toFixed(2)})
                </Text>
                <Input
                  type="number"
                  value={globalDetalMargin}
                  onChange={(e) => setGlobalDetalMargin(e.target.value)}
                />
              </div>
              <div>
                <Text className="text-xs font-bold mb-1">
                  📦 % Ganancia Mayor (÷{getIndustrialDivisor(Number(globalMayorMargin)).toFixed(2)})
                </Text>
                <Input
                  type="number"
                  value={globalMayorMargin}
                  onChange={(e) => setGlobalMayorMargin(e.target.value)}
                />
              </div>
              <div>
                <Text className="text-xs font-bold mb-1">
                  🏷️ % Descuento Oferta
                </Text>
                <Input
                  type="number"
                  value={globalDiscount}
                  onChange={(e) => setGlobalDiscount(e.target.value)}
                />
              </div>
              <Button
                variant="primary"
                isLoading={applyingBulk}
                onClick={() => handleApplyGlobalPercentages("margins")}
              >
                ⚡ Aplicar Márgenes %
              </Button>
            </div>

            <div className="lg:col-span-5 grid grid-cols-1 sm:grid-cols-2 gap-3 items-end bg-ui-bg-base p-3.5 rounded-xl border">
              <div>
                <Text className="text-xs font-bold mb-1">
                  📈 Subir / Bajar Precios Actuales (%)
                </Text>
                <Input
                  type="number"
                  value={globalPriceAdjust}
                  onChange={(e) => setGlobalPriceAdjust(e.target.value)}
                  placeholder="Ej: 10 para +10% o -5"
                />
              </div>
              <Button
                variant="secondary"
                isLoading={applyingBulk}
                onClick={() => handleApplyGlobalPercentages("adjust")}
              >
                🔄 Ajustar en Bloque
              </Button>
            </div>
          </div>
        </div>
      </Container>

      {/* Search Bar for Individual Product Lookup */}
      <Container className="p-4">
        <div className="flex flex-col sm:flex-row items-center justify-between gap-4">
          <div className="w-full sm:w-96">
            <Input
              placeholder="🔍 Buscar en inventario por nombre o código 770..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <div className="flex flex-wrap items-center gap-3">
            {Object.keys(rowEdits).length > 0 && (
              <Button
                variant="primary"
                size="small"
                isLoading={applyingBulk}
                onClick={handleSaveAllEditedRows}
              >
                💾 Guardar Todos los Cambios ({Object.keys(rowEdits).length})
              </Button>
            )}
            <Text className="text-xs text-ui-fg-muted">
              💡 Puedes editar el <strong>%</strong> (automático) o escribir el{" "}
              <strong>Precio $ COP</strong> (manual) en cada fila.
            </Text>
          </div>
        </div>
      </Container>

      {/* Full Edit Modal */}
      {showCreateModal && (
        <Container className="p-6 border-2 border-emerald-500 bg-ui-bg-subtle">
          <div className="flex items-center justify-between mb-4">
            <Heading level="h2" className="text-lg font-bold">
              {editingProduct
                ? `✏️ Editando Foto, Código y Precios: ${editingProduct.title}`
                : "➕ Nuevo Producto"}
            </Heading>
            <Button
              variant="transparent"
              onClick={() => setShowCreateModal(false)}
            >
              ✕ Cerrar
            </Button>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div className="md:col-span-2">
              <Text className="text-xs font-bold mb-1">
                Nombre del Producto *
              </Text>
              <Input
                value={formTitle}
                onChange={(e) => setFormTitle(e.target.value)}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                Código de Barras (770) *
              </Text>
              <div className="flex gap-2">
                <Input
                  value={formBarcode}
                  onChange={(e) => setFormBarcode(e.target.value)}
                />
                <Button
                  variant="secondary"
                  type="button"
                  onClick={() => setFormBarcode(generateColombianBarcode())}
                >
                  🎲
                </Button>
              </div>
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">Categoría</Text>
              <Select
                value={formCategoryId}
                onValueChange={(val) => setFormCategoryId(val)}
              >
                <Select.Trigger>
                  <Select.Value placeholder="Categoría" />
                </Select.Trigger>
                <Select.Content>
                  {categories.map((c) => (
                    <Select.Item key={c.id} value={c.id}>
                      {c.name}
                    </Select.Item>
                  ))}
                </Select.Content>
              </Select>
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🏢 Sede / Sucursal Colombia
              </Text>
              <Select
                value={formSede}
                onValueChange={(val) => setFormSede(val)}
              >
                <Select.Trigger>
                  <Select.Value placeholder="Sede" />
                </Select.Trigger>
                <Select.Content>
                  {COLOMBIAN_SEDES.map((s) => (
                    <Select.Item key={s} value={s}>
                      🏢 {s}
                    </Select.Item>
                  ))}
                </Select.Content>
              </Select>
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Stock Disponible en Sede
              </Text>
              <Input
                type="number"
                value={formStockQty}
                onChange={(e) => setFormStockQty(e.target.value)}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                💵 Costo Base Unidad ($ COP)
              </Text>
              <Input
                type="number"
                value={formCostCop}
                onChange={(e) => {
                  setFormCostCop(e.target.value)
                  recalculateModalPrices(
                    e.target.value,
                    formDetalMargin,
                    formMayorMargin,
                    formMayorUnits,
                    formDiscountPct
                  )
                }}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🛍️ % Ganancia Al Detal
              </Text>
              <Input
                type="number"
                value={formDetalMargin}
                onChange={(e) => {
                  setFormDetalMargin(e.target.value)
                  recalculateModalPrices(
                    formCostCop,
                    e.target.value,
                    formMayorMargin,
                    formMayorUnits,
                    formDiscountPct
                  )
                }}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 % Ganancia Al por Mayor
              </Text>
              <Input
                type="number"
                value={formMayorMargin}
                onChange={(e) => {
                  setFormMayorMargin(e.target.value)
                  recalculateModalPrices(
                    formCostCop,
                    formDetalMargin,
                    e.target.value,
                    formMayorUnits,
                    formDiscountPct
                  )
                }}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Unidades por Caja Mayorista
              </Text>
              <Input
                type="number"
                value={formMayorUnits}
                onChange={(e) => {
                  setFormMayorUnits(e.target.value)
                  recalculateModalPrices(
                    formCostCop,
                    formDetalMargin,
                    formMayorMargin,
                    e.target.value,
                    formDiscountPct
                  )
                }}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🛍️ Precio Final Detal ($ COP - Manual)
              </Text>
              <Input
                type="number"
                value={formDetalPrice}
                onChange={(e) => setFormDetalPrice(e.target.value)}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🛍️ Etiqueta Formato Detal
              </Text>
              <Input
                value={formDetalLabel}
                onChange={(e) => setFormDetalLabel(e.target.value)}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Precio Final Mayorista ($ COP - Manual)
              </Text>
              <Input
                type="number"
                value={formMayorPrice}
                onChange={(e) => setFormMayorPrice(e.target.value)}
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Etiqueta Formato Mayor
              </Text>
              <Input
                value={formMayorLabel}
                onChange={(e) => setFormMayorLabel(e.target.value)}
              />
            </div>

            <div className="md:col-span-2">
              <Text className="text-xs font-bold mb-1">
                🖼️ URL de Imagen o Subir desde tu PC
              </Text>
              <div className="flex gap-2">
                <Input
                  value={formImage}
                  onChange={(e) => setFormImage(e.target.value)}
                  placeholder="https://..."
                />
                <label className="cursor-pointer px-3 py-1.5 rounded-lg border bg-ui-bg-base hover:bg-ui-bg-base-hover text-xs font-bold shrink-0 flex items-center">
                  📁 Subir Archivo
                  <input
                    type="file"
                    accept="image/*"
                    className="hidden"
                    onChange={(e) => handleFileUpload(e, "modal")}
                  />
                </label>
              </div>
            </div>

            <div className="flex items-center gap-3">
              {formImage && (
                <img
                  src={formImage}
                  alt="Preview"
                  className="w-12 h-12 object-cover rounded border"
                />
              )}
              <Text className="text-xs text-ui-fg-subtle">Vista previa</Text>
            </div>

            <div className="md:col-span-4">
              <Text className="text-xs font-bold mb-1">Descripción</Text>
              <Textarea
                value={formDescription}
                onChange={(e) => setFormDescription(e.target.value)}
              />
            </div>
          </div>

          <div className="mt-5 flex justify-end gap-3">
            <Button
              variant="secondary"
              onClick={() => setShowCreateModal(false)}
            >
              Cancelar
            </Button>
            <Button
              variant="primary"
              isLoading={savingId !== null}
              onClick={handleSaveProduct}
            >
              💾 Guardar Cambios
            </Button>
          </div>
        </Container>
      )}

      {/* Products Table */}
      <Container className="p-0 overflow-hidden">
        {loading ? (
          <div className="p-12 text-center">
            <Text>Cargando productos y códigos de barras...</Text>
          </div>
        ) : (
          <Table>
            <Table.Header>
              <Table.Row>
                <Table.HeaderCell>Producto / Código 770</Table.HeaderCell>
                <Table.HeaderCell>🏢 Sede / Stock</Table.HeaderCell>
                <Table.HeaderCell>💵 Costo Base (COP)</Table.HeaderCell>
                <Table.HeaderCell>🛍️ % Detal y Precio ($ COP)</Table.HeaderCell>
                <Table.HeaderCell>📦 % Mayor y Precio ($ COP)</Table.HeaderCell>
                <Table.HeaderCell>🏷️ % Desc.</Table.HeaderCell>
                <Table.HeaderCell className="text-right">
                  Guardar / Editar por Código
                </Table.HeaderCell>
              </Table.Row>
            </Table.Header>
            <Table.Body>
              {filteredProducts.map((p) => {
                const baseInfo = getProductDetails(p)
                const current = rowEdits[p.id] || baseInfo
                const hasChanges = Boolean(rowEdits[p.id])
                const img = p.thumbnail || p.images?.[0]?.url

                return (
                  <Table.Row key={p.id}>
                    <Table.Cell>
                      <div className="flex items-center gap-3">
                        <div className="w-11 h-11 rounded-lg overflow-hidden bg-ui-bg-subtle border shrink-0 flex items-center justify-center">
                          {img ? (
                            <img
                              src={img}
                              alt={p.title}
                              className="w-full h-full object-cover"
                            />
                          ) : (
                            <span>📷</span>
                          )}
                        </div>
                        <div className="flex flex-col">
                          <span className="font-bold text-ui-fg-base text-xs sm:text-sm">
                            {p.title}
                          </span>
                          <span className="text-[11px] font-mono text-ui-fg-subtle">
                            ║▌║ {baseInfo.barcode} • {baseInfo.categoryName}
                          </span>
                        </div>
                      </div>
                    </Table.Cell>

                    <Table.Cell>
                      <div className="flex flex-col gap-1 w-40">
                        <Select
                          size="small"
                          value={current.sede || "Todas las Sedes"}
                          onValueChange={(val) =>
                            updateRowSedeOrStock(p, "sede", val)
                          }
                        >
                          <Select.Trigger>
                            <Select.Value placeholder="Sede" />
                          </Select.Trigger>
                          <Select.Content>
                            {COLOMBIAN_SEDES.map((s) => (
                              <Select.Item key={s} value={s}>
                                🏢 {s}
                              </Select.Item>
                            ))}
                          </Select.Content>
                        </Select>
                        <div className="flex items-center gap-1">
                          <span className="text-[10px] font-bold text-ui-fg-subtle">
                            Stock:
                          </span>
                          <Input
                            type="number"
                            size="small"
                            value={current.stockQty ?? 150}
                            onChange={(e) =>
                              updateRowSedeOrStock(
                                p,
                                "stockQty",
                                Number(e.target.value || 0)
                              )
                            }
                          />
                        </div>
                      </div>
                    </Table.Cell>

                    <Table.Cell>
                      <div className="w-28">
                        <Input
                          type="number"
                          size="small"
                          value={current.costCop}
                          onChange={(e) =>
                            updateRowField(
                              p,
                              "costCop",
                              Number(e.target.value || 0)
                            )
                          }
                        />
                      </div>
                    </Table.Cell>

                    <Table.Cell>
                      <div className="flex flex-col gap-1">
                        <div className="flex items-center gap-1.5">
                          <div
                            className="w-16"
                            title="% Ganancia Al Detal (Fórmula Grandes Industrias: Costo ÷ 0.80 para 20%)"
                          >
                            <Input
                              type="number"
                              size="small"
                              value={current.detalPct}
                              onChange={(e) =>
                                updateRowField(
                                  p,
                                  "detalPct",
                                  Number(e.target.value || 0)
                                )
                              }
                            />
                          </div>
                          <span className="text-xs font-bold text-ui-fg-muted">
                            %
                          </span>
                          <div
                            className="w-28"
                            title="Precio Al Detal ($ COP) - Puedes editarlo manual"
                          >
                            <Input
                              type="number"
                              size="small"
                              value={current.detalPrice}
                              onChange={(e) =>
                                updateRowManualPrice(
                                  p,
                                  "detalPrice",
                                  Number(e.target.value || 0)
                                )
                              }
                            />
                          </div>
                        </div>
                        <span className="text-[11px] font-mono text-emerald-700 font-semibold">
                          ÷ {getIndustrialDivisor(current.detalPct).toFixed(2)} → Ganancia:{" "}
                          {formatCop(current.detalPrice - current.costCop)}
                        </span>
                      </div>
                    </Table.Cell>

                    <Table.Cell>
                      <div className="flex flex-col gap-1">
                        <div className="flex items-center gap-1.5">
                          <div
                            className="w-16"
                            title="% Ganancia Mayorista (Fórmula Grandes Industrias: Costo Caja ÷ 0.85 para 15%)"
                          >
                            <Input
                              type="number"
                              size="small"
                              value={current.mayorPct}
                              onChange={(e) =>
                                updateRowField(
                                  p,
                                  "mayorPct",
                                  Number(e.target.value || 0)
                                )
                              }
                            />
                          </div>
                          <span className="text-xs font-bold text-ui-fg-muted">
                            %
                          </span>
                          <div
                            className="w-28"
                            title="Precio Mayorista ($ COP) - Puedes editarlo manual"
                          >
                            <Input
                              type="number"
                              size="small"
                              value={current.mayorPrice}
                              onChange={(e) =>
                                updateRowManualPrice(
                                  p,
                                  "mayorPrice",
                                  Number(e.target.value || 0)
                                )
                              }
                            />
                          </div>
                        </div>
                        <span className="text-[11px] font-mono text-amber-700 font-semibold">
                          ÷ {getIndustrialDivisor(current.mayorPct).toFixed(2)} (x
                          {current.mayorUnits}u) → Ganancia:{" "}
                          {formatCop(
                            current.mayorPrice -
                              current.costCop * current.mayorUnits
                          )}{" "}
                          • PUM:{" "}
                          {formatCop(
                            Math.round(
                              current.mayorPrice /
                                Math.max(1, current.mayorUnits)
                            )
                          )}
                          /ud
                        </span>
                      </div>
                    </Table.Cell>

                    <Table.Cell>
                      <div className="w-16">
                        <Input
                          type="number"
                          size="small"
                          value={current.discountPct}
                          onChange={(e) =>
                            updateRowField(
                              p,
                              "discountPct",
                              Number(e.target.value || 0)
                            )
                          }
                        />
                      </div>
                    </Table.Cell>

                    <Table.Cell className="text-right">
                      <div className="flex items-center justify-end gap-1.5">
                        {hasChanges && (
                          <Button
                            variant="primary"
                            size="small"
                            isLoading={savingId === p.id}
                            onClick={() => handleSaveRowPercentage(p)}
                          >
                            💾 Guardar
                          </Button>
                        )}
                        <Button
                          variant="secondary"
                          size="small"
                          type="button"
                          onClick={() => loadProductIntoBarcodeBar(p)}
                          title="Cargar este código en el Escáner Superior para editarlo por código"
                        >
                          🎯 Por Código
                        </Button>
                        <Button
                          variant="secondary"
                          size="small"
                          onClick={() => openEditModal(p)}
                        >
                          ✏️ Foto/Todo
                        </Button>
                        <Button
                          variant="danger"
                          size="small"
                          onClick={() => handleDelete(p.id, p.title)}
                        >
                          🗑️
                        </Button>
                      </div>
                    </Table.Cell>
                  </Table.Row>
                )
              })}
            </Table.Body>
          </Table>
        )}
      </Container>
    </div>
  )
}

export const config = defineRouteConfig({
  label: "POS Porcentajes & Códigos",
  icon: TagSolid,
})

export default POSBarcodeManagerPage
