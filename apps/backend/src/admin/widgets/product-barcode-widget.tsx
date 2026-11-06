import { defineWidgetConfig } from "@medusajs/admin-sdk"
import {
  Badge,
  Button,
  Container,
  Heading,
  Input,
  Text,
  toast,
} from "@medusajs/ui"
import { useEffect, useState } from "react"

const roundCop100 = (val: number) => Math.max(100, Math.round(val / 100) * 100)

const ProductBarcodeImageWidget = ({ data }: { data: any }) => {
  const productId = data?.id
  const [barcode, setBarcode] = useState<string>("")
  const [imageUrl, setImageUrl] = useState<string>("")
  const [costCop, setCostCop] = useState<string>("5000")
  const [detalMarginPct, setDetalMarginPct] = useState<string>("30")
  const [mayorMarginPct, setMayorMarginPct] = useState<string>("15")
  const [mayorUnits, setMayorUnits] = useState<string>("10")
  const [discountPct, setDiscountPct] = useState<string>("0")
  const [detalPrice, setDetalPrice] = useState<string>("6500")
  const [mayorPrice, setMayorPrice] = useState<string>("57500")
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
    const mayorVar =
      variants.find(
        (v: any) =>
          v.title?.toLowerCase().includes("mayor") ||
          v.sku?.toUpperCase().startsWith("MAYOR")
      ) || variants[1]

    const getCop = (v: any, fb: number) => {
      const p = v?.prices?.find(
        (pr: any) => pr.currency_code?.toLowerCase() === "cop"
      )
      return p?.amount ?? fb
    }

    const dPrice = getCop(detalVar, 6500)
    const mPrice = getCop(mayorVar, 57500)
    const meta = data.metadata || {}

    const bc =
      meta.barcode ||
      detalVar?.barcode ||
      detalVar?.ean ||
      `77000${(data.id || "").slice(-8).replace(/\D/g, "5")}`

    const cCop = Number(meta.cost_cop) || roundCop100(dPrice / 1.3)
    const dPct =
      meta.detal_margin_pct !== undefined ? Number(meta.detal_margin_pct) : 30
    const mPct =
      meta.mayor_margin_pct !== undefined ? Number(meta.mayor_margin_pct) : 15
    const mUnits = Number(meta.mayor_units) || 10
    const disc = Number(meta.discount_pct || 0)

    setBarcode(bc)
    setImageUrl(data.thumbnail || data.images?.[0]?.url || "")
    setCostCop(String(cCop))
    setDetalMarginPct(String(dPct))
    setMayorMarginPct(String(mPct))
    setMayorUnits(String(mUnits))
    setDiscountPct(String(disc))
    setDetalPrice(String(dPrice))
    setMayorPrice(String(mPrice))
    setDetalLabel(meta.detal_label || "Unidad Estándar")
    setMayorLabel(meta.mayor_label || "Caja Mayorista")
  }, [data])

  const recalc = (
    cStr: string,
    dPctStr: string,
    mPctStr: string,
    uStr: string,
    discStr: string
  ) => {
    const cost = Number(cStr) || 0
    const dPct = Number(dPctStr) || 0
    const mPct = Number(mPctStr) || 0
    const units = Math.max(1, Number(uStr) || 10)
    const disc = Math.min(90, Math.max(0, Number(discStr) || 0))
    const factor = 1 - disc / 100
    if (cost > 0) {
      setDetalPrice(String(roundCop100(cost * (1 + dPct / 100) * factor)))
      setMayorPrice(
        String(roundCop100(cost * units * (1 + mPct / 100) * factor))
      )
    }
  }

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
          costCop: Number(costCop),
          detalMarginPct: Number(detalMarginPct),
          mayorMarginPct: Number(mayorMarginPct),
          mayorUnits: Number(mayorUnits),
          discountPct: Number(discountPct),
          detalPriceCop: Number(detalPrice),
          mayorPriceCop: Number(mayorPrice),
          detalLabel,
          mayorLabel,
        }),
      })
      if (!res.ok) throw new Error("Error")
      toast.success(
        "¡Porcentajes, Precios COP, Código de Barras e Imagen actualizados!"
      )
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
            <Badge color="green">CALCULADORA DE PORCENTAJES (%)</Badge>
            <Badge color="blue">EAN-13 / GS1 770</Badge>
          </div>
          <Heading level="h2">
            Control Individual: Porcentaje de Ganancia (%), Código de Barras e Imagen
          </Heading>
          <Text className="text-xs text-ui-fg-subtle">
            Ajusta el Costo Base y los Porcentajes (%) Al Detal y Al por Mayor para calcular automáticamente el precio en Pesos Colombianos ($ COP).
          </Text>
        </div>

        <div className="bg-ui-bg-subtle px-4 py-2 rounded-lg border text-center font-mono">
          <div className="tracking-[3px] font-extrabold text-sm">
            ||| |||| || |||| |||
          </div>
          <div className="text-xs font-bold">{barcode || "7700000000000"}</div>
        </div>
      </div>

      {/* Row 1: Cost & Percentages Calculator */}
      <div className="grid grid-cols-1 md:grid-cols-5 gap-3 bg-ui-bg-subtle p-4 rounded-xl border mb-4">
        <div>
          <Text className="text-xs font-bold mb-1">
            💵 Costo Base ($ COP)
          </Text>
          <Input
            type="number"
            value={costCop}
            onChange={(e) => {
              setCostCop(e.target.value)
              recalc(
                e.target.value,
                detalMarginPct,
                mayorMarginPct,
                mayorUnits,
                discountPct
              )
            }}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            🛍️ % Ganancia Detal
          </Text>
          <Input
            type="number"
            value={detalMarginPct}
            onChange={(e) => {
              setDetalMarginPct(e.target.value)
              recalc(
                costCop,
                e.target.value,
                mayorMarginPct,
                mayorUnits,
                discountPct
              )
            }}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 % Ganancia Mayor
          </Text>
          <Input
            type="number"
            value={mayorMarginPct}
            onChange={(e) => {
              setMayorMarginPct(e.target.value)
              recalc(
                costCop,
                detalMarginPct,
                e.target.value,
                mayorUnits,
                discountPct
              )
            }}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 Uds por Caja Mayor
          </Text>
          <Input
            type="number"
            value={mayorUnits}
            onChange={(e) => {
              setMayorUnits(e.target.value)
              recalc(
                costCop,
                detalMarginPct,
                mayorMarginPct,
                e.target.value,
                discountPct
              )
            }}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            🏷️ % Descuento Oferta
          </Text>
          <Input
            type="number"
            value={discountPct}
            onChange={(e) => {
              setDiscountPct(e.target.value)
              recalc(
                costCop,
                detalMarginPct,
                mayorMarginPct,
                mayorUnits,
                e.target.value
              )
            }}
          />
        </div>
      </div>

      {/* Row 2: Resulting Prices, Barcode & Image */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <Text className="text-xs font-bold mb-1">
            🛍️ Precio Venta Al Detal Resultante ($ COP)
          </Text>
          <Input
            type="number"
            value={detalPrice}
            onChange={(e) => setDetalPrice(e.target.value)}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 Precio Venta Mayorista Resultante ($ COP)
          </Text>
          <Input
            type="number"
            value={mayorPrice}
            onChange={(e) => setMayorPrice(e.target.value)}
          />
        </div>

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
            🖼️ URL de Imagen Principal
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
            🛍️ Etiqueta Formato Al Detal
          </Text>
          <Input
            value={detalLabel}
            onChange={(e) => setDetalLabel(e.target.value)}
          />
        </div>

        <div>
          <Text className="text-xs font-bold mb-1">
            📦 Etiqueta Formato Al por Mayor
          </Text>
          <Input
            value={mayorLabel}
            onChange={(e) => setMayorLabel(e.target.value)}
          />
        </div>
      </div>

      <div className="mt-4 flex justify-end">
        <Button
          variant="primary"
          isLoading={saving}
          onClick={handleQuickSave}
        >
          💾 Guardar Porcentajes (%), Precios e Imagen
        </Button>
      </div>
    </Container>
  )
}

export const config = defineWidgetConfig({
  zone: "product.details.before",
})

export default ProductBarcodeImageWidget
