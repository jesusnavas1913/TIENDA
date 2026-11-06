import { defineWidgetConfig } from "@medusajs/admin-sdk"
import { Badge, Button, Container, Heading, Input, Text, toast } from "@medusajs/ui"
import { useEffect, useState } from "react"

const ProductBarcodeImageWidget = ({ data }: { data: any }) => {
  const productId = data?.id
  const [barcode, setBarcode] = useState<string>("")
  const [imageUrl, setImageUrl] = useState<string>("")
  const [detalPrice, setDetalPrice] = useState<string>("")
  const [mayorPrice, setMayorPrice] = useState<string>("")
  const [detalLabel, setDetalLabel] = useState<string>("")
  const [mayorLabel, setMayorLabel] = useState<string>("")
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    if (!data) return
    const variants = data.variants || []
    const detalVar =
      variants.find(
        (v: any) =>
          v.title?.toLowerCase().includes("detal") ||
          v.sku?.toUpperCase().startsWith("DETAL")
      ) || variants[0]

    const bc =
      data.metadata?.barcode ||
      detalVar?.barcode ||
      detalVar?.ean ||
      `77000${(data.id || "").slice(-8).replace(/\D/g, "5")}`

    setBarcode(bc)
    setImageUrl(data.thumbnail || data.images?.[0]?.url || "")
    setDetalLabel(data.metadata?.detal_label || "Unidad Estándar")
    setMayorLabel(data.metadata?.mayor_label || "Caja Mayorista")
  }, [data])

  const generateEAN = () => {
    setBarcode(`770${Math.floor(1000000000 + Math.random() * 9000000000)}`)
  }

  const handleQuickSave = async () => {
    if (!productId) return
    setSaving(true)
    try {
      const res = await fetch("/admin/pos-manager", {
        method: "POST",
        credentials: "include",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "update",
          productId,
          barcode,
          imageUrl,
          detalLabel,
          mayorLabel,
          ...(detalPrice ? { detalPriceCop: Number(detalPrice) } : {}),
          ...(mayorPrice ? { mayorPriceCop: Number(mayorPrice) } : {}),
        }),
      })
      if (!res.ok) throw new Error("Error")
      toast.success("¡Código de Barras, Imagen y Formatos actualizados!")
      window.location.reload()
    } catch {
      toast.error("Error al guardar cambios rápidos")
    } finally {
      setSaving(false)
    }
  }

  return (
    <Container className="p-6 border-2 border-emerald-500/30">
      <div className="flex items-center justify-between mb-4">
        <div>
          <div className="flex items-center gap-2 mb-1">
            <Badge color="green">POS AUTOSERVICIO COLOMBIA</Badge>
            <Badge color="blue">EAN-13 / GS1 770</Badge>
          </div>
          <Heading level="h2">
            Edición Rápida: Código de Barras, Fotografía y Precios Mayor / Detal
          </Heading>
          <Text className="text-xs text-ui-fg-subtle">
            Modifica la imagen principal, asigna el código de barras del lector óptico y ajusta los precios en COP.
          </Text>
        </div>

        {/* Visual Barcode Box */}
        <div className="bg-ui-bg-subtle px-4 py-2 rounded-lg border text-center font-mono">
          <div className="tracking-[3px] font-extrabold text-sm">
            ||| |||| || |||| |||
          </div>
          <div className="text-xs font-bold">{barcode || "7700000000000"}</div>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <Text className="text-xs font-bold mb-1">
            🔫 Código de Barras (EAN-13 / Lector POS)
          </Text>
          <div className="flex gap-2">
            <Input
              value={barcode}
              onChange={(e) => setBarcode(e.target.value)}
              placeholder="770..."
            />
            <Button variant="secondary" type="button" onClick={generateEAN}>
              🎲 Generar 770
            </Button>
          </div>
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            🖼️ URL de Imagen Principal (Modificación directa)
          </Text>
          <div className="flex gap-2 items-center">
            <Input
              value={imageUrl}
              onChange={(e) => setImageUrl(e.target.value)}
              placeholder="https://..."
            />
            {imageUrl && (
              <img
                src={imageUrl}
                alt="Preview"
                className="w-9 h-9 rounded object-cover border shrink-0"
              />
            )}
          </div>
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            🛍️ Formato Al Detal (ej: Bolsa x 1kg)
          </Text>
          <Input
            value={detalLabel}
            onChange={(e) => setDetalLabel(e.target.value)}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 Formato Al por Mayor (ej: Paca x 25kg)
          </Text>
          <Input
            value={mayorLabel}
            onChange={(e) => setMayorLabel(e.target.value)}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            🛍️ Actualizar Precio Al Detal ($ COP - opcional)
          </Text>
          <Input
            type="number"
            value={detalPrice}
            onChange={(e) => setDetalPrice(e.target.value)}
            placeholder="Dejar vacío para mantener actual"
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 Actualizar Precio Mayorista ($ COP - opcional)
          </Text>
          <Input
            type="number"
            value={mayorPrice}
            onChange={(e) => setMayorPrice(e.target.value)}
            placeholder="Dejar vacío para mantener actual"
          />
        </div>
      </div>

      <div className="mt-4 flex justify-end">
        <Button
          variant="primary"
          isLoading={saving}
          onClick={handleQuickSave}
        >
          💾 Guardar Código de Barras e Imagen
        </Button>
      </div>
    </Container>
  )
}

export const config = defineWidgetConfig({
  zone: "product.details.before",
})

export default ProductBarcodeImageWidget

