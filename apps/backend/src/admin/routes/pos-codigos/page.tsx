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
import { useEffect, useMemo, useState } from "react"

const roundCop100 = (val: number) => Math.max(100, Math.round(val / 100) * 100)

const POSBarcodeManagerPage = () => {
  const [products, setProducts] = useState<any[]>([])
  const [categories, setCategories] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState("")
  const [savingId, setSavingId] = useState<string | null>(null)
  const [showCreateModal, setShowCreateModal] = useState(false)
  const [editingProduct, setEditingProduct] = useState<any | null>(null)

  // Global / Bulk Percentage States
  const [targetScope, setTargetScope] = useState<string>("all")
  const [globalDetalMargin, setGlobalDetalMargin] = useState<string>("30")
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

  // Form states for Create / Full Edit Modal
  const [formTitle, setFormTitle] = useState("")
  const [formBarcode, setFormBarcode] = useState("")
  const [formImage, setFormImage] = useState("")
  const [formDescription, setFormDescription] = useState("")
  const [formCategoryId, setFormCategoryId] = useState("")
  const [formCostCop, setFormCostCop] = useState("5000")
  const [formDetalMargin, setFormDetalMargin] = useState("30")
  const [formMayorMargin, setFormMayorMargin] = useState("15")
  const [formMayorUnits, setFormMayorUnits] = useState("10")
  const [formDiscountPct, setFormDiscountPct] = useState("0")
  const [formDetalPrice, setFormDetalPrice] = useState("6500")
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
      if (json.categories?.[0]?.id && !formCategoryId) {
        setFormCategoryId(json.categories[0].id)
      }
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
      Number(meta.cost_cop) || roundCop100(detalPrice / 1.3)
    const detalPct =
      meta.detal_margin_pct !== undefined
        ? Number(meta.detal_margin_pct)
        : Math.max(5, Math.round(((detalPrice - costCop) / costCop) * 100))
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

  const openCreateModal = () => {
    setEditingProduct(null)
    setFormTitle("")
    setFormBarcode(generateColombianBarcode())
    setFormImage("")
    setFormDescription("")
    setFormCostCop("5000")
    setFormDetalMargin("30")
    setFormMayorMargin("15")
    setFormMayorUnits("10")
    setFormDiscountPct("0")
    setFormDetalPrice("6500")
    setFormMayorPrice("57500")
    setFormDetalLabel("Unidad Estándar")
    setFormMayorLabel("Caja Mayorista x 10 uds")
    setShowCreateModal(true)
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

      toast.success(
        editingProduct
          ? "¡Producto, Porcentajes y Precios COP actualizados!"
          : "¡Nuevo producto creado con Código de Barras y Porcentajes!"
      )
      setShowCreateModal(false)
      await loadData()
    } catch {
      toast.error("No se pudo guardar el producto")
    } finally {
      setSavingId(null)
    }
  }

  // Inline row percentage change handler
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
      toast.success(`¡Porcentajes de "${p.title}" aplicados!`)
      await loadData()
    } catch {
      toast.error("Error guardando porcentaje individual")
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
      {/* Top Header */}
      <Container className="p-6">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <Badge color="green">🇨🇴 SÚPER EXPRESS COLOMBIA</Badge>
              <Badge color="purple">CONTROL DE PORCENTAJES GLOBAL E INDIVIDUAL</Badge>
              <Badge color="blue">EAN-13 / 770</Badge>
            </div>
            <Heading level="h1" className="text-2xl font-bold">
              Centro de Control: Porcentajes de Ganancia (%), Códigos 770 e Imágenes
            </Heading>
            <Text className="text-ui-fg-subtle text-sm mt-1">
              Busca cualquier producto para cambiar su porcentaje individual en vivo, o aplica un porcentaje global a toda la tienda o a una categoría.
            </Text>
          </div>
          <div className="flex items-center gap-3">
            <Button variant="secondary" onClick={loadData}>
              🔄 Actualizar
            </Button>
            <Button variant="primary" onClick={openCreateModal}>
              ➕ Nuevo Producto
            </Button>
          </div>
        </div>
      </Container>

      {/* GLOBAL PERCENTAGE ENGINE PANEL */}
      <Container className="p-6 border-2 border-emerald-500/40 bg-ui-bg-subtle">
        <div className="flex flex-col gap-4">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
            <div>
              <Heading level="h2" className="text-base font-bold">
                📊 Motor de Porcentajes Globales (Toda la Tienda o por Categoría)
              </Heading>
              <Text className="text-xs text-ui-fg-subtle">
                Elige si deseas aplicar los porcentajes a todos los productos o solo al departamento seleccionado.
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
            {/* Option A: Set Global Profit Margin % */}
            <div className="lg:col-span-7 grid grid-cols-1 sm:grid-cols-4 gap-3 items-end bg-ui-bg-base p-4 rounded-xl border">
              <div>
                <Text className="text-xs font-bold mb-1">
                  🛍️ % Ganancia Detal
                </Text>
                <Input
                  type="number"
                  value={globalDetalMargin}
                  onChange={(e) => setGlobalDetalMargin(e.target.value)}
                  placeholder="30"
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
                  placeholder="15"
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
                  placeholder="0"
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

            {/* Option B: Quick Global Increase / Decrease % */}
            <div className="lg:col-span-5 grid grid-cols-1 sm:grid-cols-2 gap-3 items-end bg-ui-bg-base p-4 rounded-xl border">
              <div>
                <Text className="text-xs font-bold mb-1">
                  📈 Subir / Bajar Precios Actuales (%)
                </Text>
                <Input
                  type="number"
                  value={globalPriceAdjust}
                  onChange={(e) => setGlobalPriceAdjust(e.target.value)}
                  placeholder="Ej: 10 para +10% o -5 para -5%"
                />
              </div>
              <Button
                variant="secondary"
                isLoading={applyingBulk}
                onClick={() => handleApplyGlobalPercentages("adjust")}
              >
                🔄 Ajustar Precios en Bloque
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
              placeholder="🔍 Busca un producto o escanea código 770 para cambiar su %..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <Text className="text-xs text-ui-fg-muted">
            💡 <strong>Tip:</strong> Cambia el <strong>Costo Base</strong>, el{" "}
            <strong>% Detal</strong> o el <strong>% Mayor</strong> en cualquier fila y pulsa{" "}
            <strong>💾 Aplicar</strong>.
          </Text>
        </div>
      </Container>

      {/* Create / Full Edit Modal */}
      {showCreateModal && (
        <Container className="p-6 border-2 border-emerald-500 bg-ui-bg-subtle">
          <div className="flex items-center justify-between mb-4">
            <Heading level="h2" className="text-lg font-bold">
              {editingProduct
                ? `✏️ Editando Completo: ${editingProduct.title}`
                : "➕ Crear Producto con Calculadora de Porcentajes (%)"}
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
                placeholder="Ej: Aceite Gourmet x 1000ml"
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

            {/* Percentage Calculator Row */}
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
                🛍️ Precio Final Detal ($ COP)
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
                📦 Precio Final Mayorista ($ COP)
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

            <div className="md:col-span-3">
              <Text className="text-xs font-bold mb-1">
                🖼️ URL de la Fotografía del Producto
              </Text>
              <Input
                value={formImage}
                onChange={(e) => setFormImage(e.target.value)}
                placeholder="https://..."
              />
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
              💾 Guardar Producto y Publicar
            </Button>
          </div>
        </Container>
      )}

      {/* Products Table with Individual Percentage Controls */}
      <Container className="p-0 overflow-hidden">
        {loading ? (
          <div className="p-12 text-center">
            <Text>Cargando productos y porcentajes...</Text>
          </div>
        ) : (
          <Table>
            <Table.Header>
              <Table.Row>
                <Table.HeaderCell>Producto / Código 770</Table.HeaderCell>
                <Table.HeaderCell>💵 Costo Base (COP)</Table.HeaderCell>
                <Table.HeaderCell>🛍️ % Detal → Precio COP</Table.HeaderCell>
                <Table.HeaderCell>📦 % Mayor → Precio COP</Table.HeaderCell>
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

                    {/* Cost Base Input */}
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

                    {/* Detal % and Calculated COP */}
                    <Table.Cell>
                      <div className="flex items-center gap-2">
                        <div className="w-20">
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
                        <div className="flex flex-col">
                          <span className="font-bold text-emerald-600 text-xs">
                            $ {Number(current.detalPrice).toLocaleString("es-CO")}
                          </span>
                          <span className="text-[10px] text-ui-fg-subtle">
                            +{current.detalPct}% detal
                          </span>
                        </div>
                      </div>
                    </Table.Cell>

                    {/* Mayor % and Calculated COP */}
                    <Table.Cell>
                      <div className="flex items-center gap-2">
                        <div className="w-20">
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
                        <div className="flex flex-col">
                          <span className="font-bold text-amber-600 text-xs">
                            $ {Number(current.mayorPrice).toLocaleString("es-CO")}
                          </span>
                          <span className="text-[10px] text-ui-fg-subtle">
                            +{current.mayorPct}% (x{current.mayorUnits}u)
                          </span>
                        </div>
                      </div>
                    </Table.Cell>

                    {/* Discount % */}
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

                    {/* Actions */}
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
