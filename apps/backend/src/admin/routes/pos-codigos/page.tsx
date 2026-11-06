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

const POSBarcodeManagerPage = () => {
  const [products, setProducts] = useState<any[]>([])
  const [categories, setCategories] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState("")
  const [savingId, setSavingId] = useState<string | null>(null)
  const [showCreateModal, setShowCreateModal] = useState(false)
  const [editingProduct, setEditingProduct] = useState<any | null>(null)

  // Form states for Create / Edit
  const [formTitle, setFormTitle] = useState("")
  const [formBarcode, setFormBarcode] = useState("")
  const [formImage, setFormImage] = useState("")
  const [formDescription, setFormDescription] = useState("")
  const [formCategoryId, setFormCategoryId] = useState("")
  const [formDetalPrice, setFormDetalPrice] = useState("6500")
  const [formMayorPrice, setFormMayorPrice] = useState("52000")
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
    } catch (e) {
      toast.error("Error cargando el catálogo POS")
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  const generateColombianBarcode = () => {
    // 770 is GS1 Colombia prefix
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
      return cop?.amount ?? v?.prices?.[0]?.amount ?? 0
    }

    const barcode =
      p.metadata?.barcode ||
      detalVar?.barcode ||
      detalVar?.ean ||
      `77000${p.id.slice(-8).replace(/\D/g, "4")}`

    return {
      barcode,
      detalPrice: getCopPrice(detalVar),
      mayorPrice: getCopPrice(mayorVar),
      detalLabel: p.metadata?.detal_label || "Unidad",
      mayorLabel: p.metadata?.mayor_label || "Caja Mayorista",
      categoryName: p.categories?.[0]?.name || "Sin Categoría",
      categoryId: p.categories?.[0]?.id || "",
    }
  }

  const openCreateModal = () => {
    setEditingProduct(null)
    setFormTitle("")
    setFormBarcode(generateColombianBarcode())
    setFormImage("")
    setFormDescription("")
    setFormDetalPrice("5000")
    setFormMayorPrice("48000")
    setFormDetalLabel("Unidad Estándar")
    setFormMayorLabel("Caja Mayorista x 12 uds")
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
    setFormDetalPrice(String(info.detalPrice || 5000))
    setFormMayorPrice(String(info.mayorPrice || 45000))
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
          detalPriceCop: Number(formDetalPrice),
          mayorPriceCop: Number(formMayorPrice),
          detalLabel: formDetalLabel,
          mayorLabel: formMayorLabel,
        }),
      })

      if (!res.ok) throw new Error("Error al guardar")

      toast.success(
        editingProduct
          ? "¡Producto, Imagen y Código de Barras actualizados!"
          : "¡Nuevo producto creado con Código de Barras!"
      )
      setShowCreateModal(false)
      await loadData()
    } catch (e) {
      toast.error("No se pudo guardar el producto")
    } finally {
      setSavingId(null)
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
      if (!search.trim()) return true
      const q = search.toLowerCase()
      const info = getProductDetails(p)
      return (
        p.title?.toLowerCase().includes(q) ||
        info.barcode?.toLowerCase().includes(q) ||
        info.categoryName?.toLowerCase().includes(q)
      )
    })
  }, [products, search])

  return (
    <div className="flex flex-col gap-y-6 p-4">
      {/* Top Header */}
      <Container className="p-6">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <Badge color="green">🇨🇴 SÚPER EXPRESS COLOMBIA</Badge>
              <Badge color="blue">LECTOR DE CÓDIGO DE BARRAS EAN-13</Badge>
            </div>
            <Heading level="h1" className="text-2xl font-bold">
              Gestor Rápido POS: Códigos de Barras, Imágenes y Precios (Mayor y Detal)
            </Heading>
            <Text className="text-ui-fg-subtle text-sm mt-1">
              Escanea o busca productos por código de barras (770...), cambia fotografías al instante y actualiza precios en Pesos Colombianos ($ COP).
            </Text>
          </div>
          <div className="flex items-center gap-3">
            <Button variant="secondary" onClick={loadData}>
              🔄 Actualizar Lista
            </Button>
            <Button variant="primary" onClick={openCreateModal}>
              ➕ Nuevo Producto con Código de Barras
            </Button>
          </div>
        </div>

        {/* Search & Barcode Scanner Input */}
        <div className="mt-6 flex flex-col sm:flex-row items-center gap-4">
          <div className="w-full sm:w-96">
            <Input
              placeholder="🔫 Escanea código de barras (ej: 770...) o escribe nombre..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <Text className="text-xs text-ui-fg-muted">
            Mostrando <strong>{filteredProducts.length}</strong> de{" "}
            <strong>{products.length}</strong> productos en inventario
          </Text>
        </div>
      </Container>

      {/* Create / Edit Modal */}
      {showCreateModal && (
        <Container className="p-6 border-2 border-emerald-500/50 bg-ui-bg-subtle">
          <div className="flex items-center justify-between mb-4">
            <Heading level="h2" className="text-lg font-bold">
              {editingProduct
                ? `✏️ Editando: ${editingProduct.title}`
                : "➕ Registrar Nuevo Producto en el Autoservicio"}
            </Heading>
            <Button
              variant="transparent"
              onClick={() => setShowCreateModal(false)}
            >
              ✕ Cerrar
            </Button>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <Text className="text-xs font-bold mb-1">
                Nombre del Producto *
              </Text>
              <Input
                value={formTitle}
                onChange={(e) => setFormTitle(e.target.value)}
                placeholder="Ej: Arroz Diana Bolsa x 1kg"
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                Código de Barras (EAN-13 / 770) *
              </Text>
              <div className="flex gap-2">
                <Input
                  value={formBarcode}
                  onChange={(e) => setFormBarcode(e.target.value)}
                  placeholder="7701234567890"
                />
                <Button
                  variant="secondary"
                  type="button"
                  onClick={() => setFormBarcode(generateColombianBarcode())}
                >
                  🎲 Generar
                </Button>
              </div>
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                Departamento / Categoría
              </Text>
              <Select
                value={formCategoryId}
                onValueChange={(val) => setFormCategoryId(val)}
              >
                <Select.Trigger>
                  <Select.Value placeholder="Selecciona categoría" />
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

            <div className="md:col-span-2">
              <Text className="text-xs font-bold mb-1">
                URL de la Imagen del Producto (pega cualquier link de foto)
              </Text>
              <Input
                value={formImage}
                onChange={(e) => setFormImage(e.target.value)}
                placeholder="https://images.unsplash.com/photo-..."
              />
            </div>

            <div className="flex items-center gap-3">
              {formImage && (
                <img
                  src={formImage}
                  alt="Preview"
                  className="w-14 h-14 object-cover rounded-lg border"
                />
              )}
              <Text className="text-xs text-ui-fg-subtle">
                Vista previa instantánea de la imagen
              </Text>
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🛍️ Precio Al Detal ($ COP)
              </Text>
              <Input
                type="number"
                value={formDetalPrice}
                onChange={(e) => setFormDetalPrice(e.target.value)}
                placeholder="6500"
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                🛍️ Formato Al Detal
              </Text>
              <Input
                value={formDetalLabel}
                onChange={(e) => setFormDetalLabel(e.target.value)}
                placeholder="Ej: Bolsa x 1kg"
              />
            </div>

            <div className="hidden md:block" />

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Precio Al por Mayor ($ COP)
              </Text>
              <Input
                type="number"
                value={formMayorPrice}
                onChange={(e) => setFormMayorPrice(e.target.value)}
                placeholder="52000"
              />
            </div>

            <div>
              <Text className="text-xs font-bold mb-1">
                📦 Formato Al por Mayor
              </Text>
              <Input
                value={formMayorLabel}
                onChange={(e) => setFormMayorLabel(e.target.value)}
                placeholder="Ej: Paca x 25kg"
              />
            </div>

            <div className="md:col-span-3">
              <Text className="text-xs font-bold mb-1">Descripción</Text>
              <Textarea
                value={formDescription}
                onChange={(e) => setFormDescription(e.target.value)}
                placeholder="Descripción detallada del producto..."
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
              💾 Guardar Producto y Publicar en Tienda
            </Button>
          </div>
        </Container>
      )}

      {/* Products Table */}
      <Container className="p-0 overflow-hidden">
        {loading ? (
          <div className="p-12 text-center">
            <Text>Cargando inventario y códigos de barras...</Text>
          </div>
        ) : (
          <Table>
            <Table.Header>
              <Table.Row>
                <Table.HeaderCell>Imagen</Table.HeaderCell>
                <Table.HeaderCell>Producto / Categoría</Table.HeaderCell>
                <Table.HeaderCell>Código de Barras (EAN)</Table.HeaderCell>
                <Table.HeaderCell>🛍️ Precio Detal (COP)</Table.HeaderCell>
                <Table.HeaderCell>📦 Precio Mayorista (COP)</Table.HeaderCell>
                <Table.HeaderCell className="text-right">
                  Acciones Rápidas
                </Table.HeaderCell>
              </Table.Row>
            </Table.Header>
            <Table.Body>
              {filteredProducts.map((p) => {
                const info = getProductDetails(p)
                const img = p.thumbnail || p.images?.[0]?.url
                return (
                  <Table.Row key={p.id}>
                    <Table.Cell>
                      <div className="w-12 h-12 rounded-lg overflow-hidden bg-ui-bg-subtle border flex items-center justify-center">
                        {img ? (
                          <img
                            src={img}
                            alt={p.title}
                            className="w-full h-full object-cover"
                          />
                        ) : (
                          <span className="text-xs">📷</span>
                        )}
                      </div>
                    </Table.Cell>
                    <Table.Cell>
                      <div className="flex flex-col">
                        <span className="font-bold text-ui-fg-base">
                          {p.title}
                        </span>
                        <span className="text-xs text-ui-fg-subtle">
                          {info.categoryName}
                        </span>
                      </div>
                    </Table.Cell>
                    <Table.Cell>
                      <div className="flex flex-col font-mono text-xs bg-ui-bg-subtle px-2.5 py-1 rounded border w-fit">
                        <span className="tracking-widest font-bold">
                          ||||| |||| |||||
                        </span>
                        <span>{info.barcode}</span>
                      </div>
                    </Table.Cell>
                    <Table.Cell>
                      <div className="flex flex-col">
                        <span className="font-bold text-emerald-600">
                          $ {Number(info.detalPrice).toLocaleString("es-CO")} COP
                        </span>
                        <span className="text-xs text-ui-fg-subtle">
                          {info.detalLabel}
                        </span>
                      </div>
                    </Table.Cell>
                    <Table.Cell>
                      <div className="flex flex-col">
                        <span className="font-bold text-amber-600">
                          $ {Number(info.mayorPrice).toLocaleString("es-CO")} COP
                        </span>
                        <span className="text-xs text-ui-fg-subtle">
                          {info.mayorLabel}
                        </span>
                      </div>
                    </Table.Cell>
                    <Table.Cell className="text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Button
                          variant="secondary"
                          size="small"
                          onClick={() => openEditModal(p)}
                        >
                          ✏️ Editar Foto / Código / Precio
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
  label: "POS Códigos & Fotos",
  icon: TagSolid,
})

export default POSBarcodeManagerPage
