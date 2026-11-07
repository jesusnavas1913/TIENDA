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

const roundCop100 = (val: number) => Math.max(100, Math.round(val / 100) * 100)

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
  const [fastDetalPrice, setFastDetalPrice] = useState("6000")
  const [fastMayorPrice, setFastMayorPrice] = useState("57500")
  const [fastCategoryId, setFastCategoryId] = useState("")
  const [fastImageUrl, setFastImageUrl] = useState("")
  const [fastSaving, setFastSaving] = useState(false)

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
      }
    >
  >({})

  // Form states for Full Edit Modal
  const [formTitle, setFormTitle] = useState("")
  const [formBarcode, setFormBarcode] = useState("")
  const [formImage, setFormImage] = useState("")
  const [formDescription, setFormDescription] = useState("")
  const [formCategoryId, setFormCategoryId] = useState("")
  const [formCostCop, setFormCostCop] = useState("5000")
  const [formDetalMargin, setFormDetalMargin] = useState("20")
  const [formMayorMargin, setFormMayorMargin] = useState("15")
  const [formMayorUnits, setFormMayorUnits] = useState("10")
  const [formDiscountPct, setFormDiscountPct] = useState("0")
  const [formDetalPrice, setFormDetalPrice] = useState("6000")
  const [formMayorPrice, setFormMayorPrice] = useState("57500")
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

    const costCop =
      Number(meta.cost_cop) || roundCop100(detalPrice / 1.2)
    const detalPct =
      meta.detal_margin_pct !== undefined
        ? Number(meta.detal_margin_pct)
        : 20
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
    }
  }

  // Fast Bar auto-calc when cost or % changes
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
      setFastDetalPrice(String(roundCop100(cost * (1 + dPct / 100))))
      setFastMayorPrice(String(roundCop100(cost * units * (1 + mPct / 100))))
    }
  }

  // When user types or scans a barcode in Fast Bar, check if it exists in store or GS1 dictionary
  const handleFastBarcodeChange = (val: string) => {
    setFastBarcode(val)
    const clean = val.trim()
    if (!clean) return

    // 1. Check if product already exists in store
    const existing = products.find((p) => {
      const info = getProductDetails(p)
      return info.barcode === clean
    })
    if (existing) {
      const info = getProductDetails(existing)
      setFastTitle(existing.title || "")
      setFastCostCop(String(info.costCop))
      setFastDetalPct(String(info.detalPct))
      setFastMayorPct(String(info.mayorPct))
      setFastMayorUnits(String(info.mayorUnits))
      setFastDetalPrice(String(info.detalPrice))
      setFastMayorPrice(String(info.mayorPrice))
      if (info.categoryId) setFastCategoryId(info.categoryId)
      setFastImageUrl(existing.thumbnail || existing.images?.[0]?.url || "")
      toast.info(`Código existente detectado: "${existing.title}" cargado para actualizar.`)
      return
    }

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
    try {
      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "create",
          barcode: finalBc,
          title: fastTitle.trim(),
          categoryId: fastCategoryId || categories[0]?.id,
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

      toast.success(
        `✅ "${fastTitle}" ingresado con Código ${finalBc} (${fastDetalPct}% Detal / ${fastMayorPct}% Mayor)`
      )
      // Reset fast bar for next barcode scan immediately!
      setFastBarcode("")
      setFastTitle("")
      setFastImageUrl("")
      await loadData()
      barcodeInputRef.current?.focus()
    } catch {
      toast.error("Error al ingresar producto rápido")
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
    const discFactor = 1 - disc / 100

    if (cost > 0) {
      const dPrice = roundCop100(cost * (1 + dPct / 100) * discFactor)
      const mPrice = roundCop100(cost * units * (1 + mPct / 100) * discFactor)
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

  const updateRowField = (
    p: any,
    field: "costCop" | "detalPct" | "mayorPct" | "discountPct",
    value: number
  ) => {
    const base = rowEdits[p.id] || getProductDetails(p)
    const next = { ...base, [field]: value }
    const discFactor = Math.max(0.1, 1 - (next.discountPct || 0) / 100)
    next.detalPrice = roundCop100(
      next.costCop * (1 + next.detalPct / 100) * discFactor
    )
    next.mayorPrice = roundCop100(
      next.costCop * next.mayorUnits * (1 + next.mayorPct / 100) * discFactor
    )
    setRowEdits((prev) => ({ ...prev, [p.id]: next }))
  }

  const updateRowManualPrice = (
    p: any,
    field: "detalPrice" | "mayorPrice",
    priceValue: number
  ) => {
    const base = rowEdits[p.id] || getProductDetails(p)
    const next = { ...base, [field]: priceValue }
    if (next.costCop > 0) {
      if (field === "detalPrice") {
        next.detalPct = Math.round(
          ((priceValue - next.costCop) / next.costCop) * 100
        )
      } else {
        const boxCost = next.costCop * (next.mayorUnits || 10)
        next.mayorPct = Math.round(((priceValue - boxCost) / boxCost) * 100)
      }
    }
    setRowEdits((prev) => ({ ...prev, [p.id]: next }))
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
        }),
      })
      if (!res.ok) throw new Error("Error")
      toast.success(`¡Precios de "${p.title}" guardados!`)
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
      if (!search.trim()) return true
      const q = search.toLowerCase()
      const info = getProductDetails(p)
      return (
        p.title?.toLowerCase().includes(q) ||
        info.barcode?.toLowerCase().includes(q) ||
        info.categoryName?.toLowerCase().includes(q)
      )
    })
  }, [products, search, targetScope])

  return (
    <div className="flex flex-col gap-y-6 p-4">
      {/* FAST 1-LINE BARCODE ENTRY SCANNER */}
      <Container className="p-6 border-2 border-emerald-600 bg-ui-bg-base shadow-md">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-2 mb-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <Badge color="green">⚡ INGRESO RÁPIDO CON LECTOR DE CÓDIGO DE BARRAS</Badge>
              <Badge color="blue">20% DETAL / 15% MAYOR AUTOMÁTICO</Badge>
            </div>
            <Heading level="h1" className="text-xl font-bold">
              Pistola POS: Escanea o Escribe el Código 770 → Pon el Costo → Enter para Guardar
            </Heading>
            <Text className="text-xs text-ui-fg-subtle">
              Si escaneas un código que ya existe, carga sus datos para actualizarlo sin errores. Prueba los códigos rápidos de muestra abajo:
            </Text>
          </div>

          <div className="flex flex-wrap gap-1.5">
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
              1️⃣ Código de Barras (770)
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

          <div className="lg:col-span-3">
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
            <Text className="text-xs font-bold mb-1">3️⃣ Categoría</Text>
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
            <Text className="text-xs font-bold mb-1">4️⃣ Costo ($)</Text>
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
              🛍️ Detal (+{fastDetalPct}%)
            </Text>
            <Input
              type="number"
              value={fastDetalPrice}
              onChange={(e) => setFastDetalPrice(e.target.value)}
              title="Precio Al Detal (Autocalculado +20% o edítalo manual)"
            />
          </div>

          <div className="lg:col-span-1">
            <Text className="text-xs font-bold mb-1">
              📦 Mayor (+{fastMayorPct}%)
            </Text>
            <Input
              type="number"
              value={fastMayorPrice}
              onChange={(e) => setFastMayorPrice(e.target.value)}
              title="Precio Mayorista (Autocalculado +15% o edítalo manual)"
            />
          </div>

          <div className="lg:col-span-2 flex gap-1.5 items-center">
            <label className="cursor-pointer px-2.5 py-2 rounded-lg border bg-ui-bg-base hover:bg-ui-bg-base-hover text-xs font-bold shrink-0">
              📷 Subir Foto
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
              ➕ Ingresar (Enter)
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
                  🛍️ % Ganancia Detal
                </Text>
                <Input
                  type="number"
                  value={globalDetalMargin}
                  onChange={(e) => setGlobalDetalMargin(e.target.value)}
                />
              </div>
              <div>
                <Text className="text-xs font-bold mb-1">
                  📦 % Ganancia Mayor
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
          <Text className="text-xs text-ui-fg-muted">
            💡 Puedes editar el <strong>%</strong> (automático) o escribir directamente el{" "}
            <strong>Precio $ COP</strong> (manual) en cada fila y pulsar <strong>💾 Aplicar %</strong>.
          </Text>
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
                <Table.HeaderCell>💵 Costo Base (COP)</Table.HeaderCell>
                <Table.HeaderCell>🛍️ % Detal y Precio ($ COP)</Table.HeaderCell>
                <Table.HeaderCell>📦 % Mayor y Precio ($ COP)</Table.HeaderCell>
                <Table.HeaderCell>🏷️ % Desc.</Table.HeaderCell>
                <Table.HeaderCell className="text-right">
                  Guardar / Editar
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
                      <div className="flex items-center gap-1.5">
                        <div
                          className="w-16"
                          title="% Ganancia Al Detal (Estándar 20%)"
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
                          title="Precio Al Detal Manual ($ COP)"
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
                    </Table.Cell>

                    <Table.Cell>
                      <div className="flex items-center gap-1.5">
                        <div
                          className="w-16"
                          title="% Ganancia Mayorista (Estándar 15%)"
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
                          title="Precio Mayorista Manual ($ COP)"
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
                            💾 Aplicar %
                          </Button>
                        )}
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
