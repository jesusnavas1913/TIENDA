"use client"

import { convertToLocale } from "@lib/util/money"
import { HttpTypes } from "@medusajs/types"
import { useState } from "react"

export const WHATSAPP_COLOMBIA_NUMBER = "573000000000"

export function buildWhatsAppCartUrl(
  cart: HttpTypes.StoreCart,
  customNotes?: {
    customerName?: string
    address?: string
    city?: string
    paymentMethod?: string
  }
) {
  const items = cart?.items || []
  const currency = cart?.currency_code || "cop"

  const lines: string[] = [
    "🇨🇴 *NUEVO PEDIDO - SÚPER EXPRESS COLOMBIA*",
    "━━━━━━━━━━━━━━━━━━━━━━",
  ]

  if (customNotes?.customerName) {
    lines.push(`👤 *Cliente:* ${customNotes.customerName}`)
  }
  if (customNotes?.city || customNotes?.address) {
    lines.push(
      `📍 *Entrega:* ${[customNotes.city, customNotes.address]
        .filter(Boolean)
        .join(" - ")}`
    )
  }
  if (customNotes?.paymentMethod) {
    lines.push(`💳 *Medio de Pago:* ${customNotes.paymentMethod}`)
  }
  if (
    customNotes?.customerName ||
    customNotes?.address ||
    customNotes?.paymentMethod
  ) {
    lines.push("━━━━━━━━━━━━━━━━━━━━━━")
  }

  lines.push("🛒 *DETALLE DE PRODUCTOS:*")

  items.forEach((item, idx) => {
    const isMayor =
      item.variant?.title?.toLowerCase().includes("mayor") ||
      item.variant?.sku?.toUpperCase().startsWith("MAYOR")
    const modeTag = isMayor ? "📦 [MAYORISTA]" : "🛍️ [AL DETAL]"
    const skuOrBarcode =
      item.variant?.barcode || item.variant?.sku || "EAN-770"
    const unitPrice = item.unit_price || 0
    const lineTotal = unitPrice * item.quantity

    lines.push(
      `${idx + 1}. *${item.title}*\n   ${modeTag} • Cant: *${
        item.quantity
      }* x ${convertToLocale({
        amount: unitPrice,
        currency_code: currency,
      })} = *${convertToLocale({
        amount: lineTotal,
        currency_code: currency,
      })}*\n   Ref/Código: \`${skuOrBarcode}\``
    )
  })

  lines.push("━━━━━━━━━━━━━━━━━━━━━━")
  const subtotal = cart?.subtotal ?? 0
  const isCOP = currency.toLowerCase() === "cop"
  const freeShipping = subtotal >= (isCOP ? 100000 : 30)

  lines.push(
    `🚚 *Domicilio:* ${
      freeShipping ? "¡GRATIS! 🎉" : isCOP ? "$ 6.000 COP" : "Estándar"
    }`
  )
  lines.push(
    `💰 *TOTAL A PAGAR: ${convertToLocale({
      amount: subtotal,
      currency_code: currency,
    })}*`
  )
  lines.push("━━━━━━━━━━━━━━━━━━━━━━")
  lines.push("✅ _Hola, envío mi carrito para confirmar despacho inmediato._")

  const text = encodeURIComponent(lines.join("\n"))
  return `https://wa.me/${WHATSAPP_COLOMBIA_NUMBER}?text=${text}`
}

export default function WhatsAppCartButton({
  cart,
  compact = false,
}: {
  cart: HttpTypes.StoreCart
  compact?: boolean
}) {
  const [showForm, setShowForm] = useState(false)
  const [customerName, setCustomerName] = useState("")
  const [city, setCity] = useState("Bogotá D.C.")
  const [address, setAddress] = useState("")
  const [paymentMethod, setPaymentMethod] = useState("Nequi / Daviplata")

  if (!cart?.items?.length) return null

  const handleSendDirect = () => {
    const url = buildWhatsAppCartUrl(cart, {
      customerName: customerName.trim() || undefined,
      city,
      address: address.trim() || undefined,
      paymentMethod,
    })
    window.open(url, "_blank", "noopener,noreferrer")
  }

  const handlePrintCartInvoice = () => {
    const win = window.open("", "_blank", "width=850,height=700")
    if (!win) return
    const items = cart?.items || []
    const currency = cart?.currency_code || "cop"
    const subtotal = cart?.subtotal ?? 0
    const rows = items
      .map((item, idx) => {
        const isMayor =
          item.variant?.title?.toLowerCase().includes("mayor") ||
          item.variant?.sku?.toUpperCase().startsWith("MAYOR")
        const modeTag = isMayor ? "MAYORISTA" : "AL DETAL"
        const bc = item.variant?.barcode || item.variant?.sku || "770"
        const unitPrice = item.unit_price || 0
        const lineTotal = unitPrice * item.quantity
        return `
          <tr>
            <td>${idx + 1}</td>
            <td style="font-family:monospace;font-weight:bold;">${bc}</td>
            <td><strong>${item.title}</strong><br/><small>${modeTag}</small></td>
            <td style="text-align:center;font-weight:bold;">${item.quantity}</td>
            <td style="text-align:right;">${convertToLocale({ amount: unitPrice, currency_code: currency })}</td>
            <td style="text-align:right;font-weight:bold;">${convertToLocale({ amount: lineTotal, currency_code: currency })}</td>
          </tr>`
      })
      .join("")

    win.document.write(`
      <html>
        <head>
          <title>Remisión / Factura Proforma - Súper Express Colombia</title>
          <style>
            body { font-family: Arial, sans-serif; padding: 28px; color: #0f172a; }
            .top { display: flex; justify-content: space-between; border-bottom: 3px solid #059669; padding-bottom: 14px; margin-bottom: 18px; }
            table { width: 100%; border-collapse: collapse; font-size: 13px; margin-top: 12px; }
            th { background: #064e3b; color: white; padding: 10px; text-align: left; }
            td { padding: 9px; border-bottom: 1px solid #cbd5e1; }
            .total-box { margin-top: 20px; text-align: right; font-size: 18px; font-weight: 900; color: #064e3b; }
            .btn { background: #059669; color: white; border: none; padding: 10px 18px; border-radius: 8px; font-weight: bold; cursor: pointer; }
            @media print { .no-print { display: none; } }
          </style>
        </head>
        <body>
          <div class="top">
            <div>
              <h2 style="margin:0;color:#064e3b;">🛒 SÚPER EXPRESS COLOMBIA — MAYOR Y DETAL</h2>
              <div style="font-size:12px;color:#475569;">NIT: 901.452.880-9 • Remisión / Cotización Oficial • Fecha: ${new Date().toLocaleString("es-CO")}</div>
              <div style="font-size:12px;margin-top:4px;"><strong>Cliente:</strong> ${customerName || "Cliente Mostrador / Web"} | <strong>Ciudad/Sede:</strong> ${city} | <strong>Pago:</strong> ${paymentMethod}</div>
            </div>
            <button class="btn no-print" onclick="window.print()">🖨️ Imprimir / Guardar PDF</button>
          </div>
          <table>
            <thead>
              <tr>
                <th>#</th>
                <th>Código 770</th>
                <th>Descripción / Modalidad</th>
                <th style="text-align:center;">Cant.</th>
                <th style="text-align:right;">Vr. Unitario</th>
                <th style="text-align:right;">Subtotal</th>
              </tr>
            </thead>
            <tbody>${rows}</tbody>
          </table>
          <div class="total-box">
            TOTAL A PAGAR: ${convertToLocale({ amount: subtotal, currency_code: currency })}
          </div>
        </body>
      </html>
    `)
    win.document.close()
  }

  if (compact) {
    return (
      <button
        type="button"
        onClick={handleSendDirect}
        className="w-full py-2.5 px-4 rounded-xl bg-[#25D366] hover:bg-[#1ebe5d] text-slate-950 font-extrabold text-xs sm:text-sm flex items-center justify-center gap-2 shadow-md transition-all"
      >
        <span>📲</span>
        <span>Enviar Lista del Carrito por WhatsApp</span>
      </button>
    )
  }

  return (
    <div className="w-full rounded-2xl border-2 border-emerald-500/40 bg-emerald-50/60 p-4 space-y-3">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-xl">📲</span>
          <div>
            <h4 className="text-sm font-extrabold text-slate-900">
              Pedido Rápido por WhatsApp Colombia
            </h4>
            <p className="text-[11px] text-slate-600">
              Envía la lista completa de tu carrito con códigos y precios
            </p>
          </div>
        </div>
        <button
          type="button"
          onClick={() => setShowForm((prev) => !prev)}
          className="text-xs font-bold text-emerald-800 underline"
        >
          {showForm ? "Ocultar datos" : "+ Agregar dirección"}
        </button>
      </div>

      {showForm && (
        <div className="space-y-2 pt-2 border-t border-emerald-200/70 text-xs">
          <input
            type="text"
            placeholder="Tu nombre o nombre del negocio"
            value={customerName}
            onChange={(e) => setCustomerName(e.target.value)}
            className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-slate-900"
          />
          <div className="grid grid-cols-2 gap-2">
            <select
              value={city}
              onChange={(e) => setCity(e.target.value)}
              className="rounded-lg border border-slate-300 bg-white px-2.5 py-2 text-slate-900 font-medium"
            >
              <option value="Bogotá D.C.">Bogotá D.C.</option>
              <option value="Medellín">Medellín</option>
              <option value="Cali">Cali</option>
              <option value="Barranquilla">Barranquilla</option>
              <option value="Otra Ciudad">Otra Ciudad</option>
            </select>
            <select
              value={paymentMethod}
              onChange={(e) => setPaymentMethod(e.target.value)}
              className="rounded-lg border border-slate-300 bg-white px-2.5 py-2 text-slate-900 font-medium"
            >
              <option value="Nequi / Daviplata">📱 Nequi / Daviplata</option>
              <option value="Efectivo Contraentrega">💵 Contraentrega</option>
              <option value="Transferencia Bancolombia / PSE">🏦 Bancolombia / PSE</option>
            </select>
          </div>
          <input
            type="text"
            placeholder="Dirección y barrio de entrega..."
            value={address}
            onChange={(e) => setAddress(e.target.value)}
            className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-slate-900"
          />
        </div>
      )}

      <div className="flex flex-col gap-2">
        <button
          type="button"
          onClick={handleSendDirect}
          className="w-full py-3 px-4 rounded-xl bg-[#25D366] hover:bg-[#1ebe5d] text-slate-950 font-extrabold text-sm flex items-center justify-center gap-2 shadow-lg transition-all"
        >
          <span>💬</span>
          <span>Enviar Pedido al WhatsApp Ahora</span>
        </button>
        <button
          type="button"
          onClick={handlePrintCartInvoice}
          className="w-full py-2.5 px-4 rounded-xl bg-white hover:bg-slate-100 text-slate-900 border border-slate-300 font-extrabold text-xs flex items-center justify-center gap-2 shadow-sm transition-all"
        >
          <span>🧾</span>
          <span>Imprimir Remisión / Factura Proforma (PDF)</span>
        </button>
      </div>
    </div>
  )
}

