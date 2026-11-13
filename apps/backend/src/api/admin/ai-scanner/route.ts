import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  const hasGemini = Boolean(process.env.GEMINI_API_KEY)
  const hasOpenAI = Boolean(process.env.OPENAI_API_KEY)

  let activeProvider = "Local OCR (Tesseract.js)"
  if (hasGemini) activeProvider = "Google Gemini 1.5 Flash (Visión IA)"
  else if (hasOpenAI) activeProvider = "OpenAI GPT-4o-mini (Visión IA)"

  res.json({
    hasGemini,
    hasOpenAI,
    activeProvider,
  })
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  try {
    const { imageBase64, rawText } = (req.body || {}) as {
      imageBase64?: string
      rawText?: string
    }

    const geminiKey = process.env.GEMINI_API_KEY
    const openaiKey = process.env.OPENAI_API_KEY

    // 1. SI ESTÁ CONFIGURADO GOOGLE GEMINI (RECOMENDADO - PLAN GRATIS DISPONIBLE)
    if (geminiKey && (imageBase64 || rawText)) {
      try {
        const parts: any[] = [
          {
            text: `Eres un asistente experto en facturación, proveedores e inventario de supermercados en Colombia.
Analiza la siguiente factura de proveedor (ej: AJE, Santander, Unilever, D1, Makro, etc.).
Para cada producto debes extraer en formato JSON estricto:
- title: Nombre comercial claro del producto (ej: "Big Cola 1.75L", "Cifrut Citrus 250ml", "Rexona Women Clínical 60g", "Jabón Puro Hortensias 180g").
- costCop: Costo unitario base en Pesos Colombianos (COP) (ej: 3200, 16000, 2400, 960). Solo el número entero.
- mayorUnits: Cantidad de unidades por paca, caja o fardo (ej: paca x 8 -> 8, caja x 12 -> 12, x 15 -> 15, x 25 -> 25).
- mayorLabel: Texto del empaque (ej: "Paca x 8 uds", "Caja x 12 uds", "Caja x 15 uds").
- detalLabel: Texto de la unidad (ej: "Botella 1.75L", "Tubo 60g", "Barra 180g").
- pasilloName: DEBE ser exactamente uno de estos 6 pasillos de supermercado:
  - "Bebidas y Licores"
  - "Aseo y Hogar"
  - "Despensa y Abarrotes"
  - "Frutas y Verduras"
  - "Carnes y Charcutería"
  - "Lácteos y Huevos"

Responde únicamente un objeto JSON con la llave "products": [...]`,
          },
        ]

        if (imageBase64) {
          const cleanB64 = imageBase64.replace(/^data:image\/[a-z]+;base64,/, "")
          const mimeMatch = imageBase64.match(/^data:(image\/[a-z]+);base64,/)
          const mimeType = mimeMatch ? mimeMatch[1] : "image/jpeg"
          parts.push({
            inline_data: {
              mime_type: mimeType,
              data: cleanB64,
            },
          })
        } else if (rawText) {
          parts.push({ text: `Texto extraído de la factura:\n${rawText}` })
        }

        const geminiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${geminiKey}`
        const aiRes = await fetch(geminiUrl, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            contents: [{ parts }],
            generationConfig: {
              response_mime_type: "application/json",
            },
          }),
        })

        if (aiRes.ok) {
          const aiData = await aiRes.json()
          const textResponse =
            aiData.candidates?.[0]?.content?.parts?.[0]?.text || "{}"
          const parsed = JSON.parse(textResponse)
          if (Array.isArray(parsed.products) && parsed.products.length > 0) {
            return res.json({
              success: true,
              provider: "Google Gemini 1.5 Flash (Visión IA)",
              products: parsed.products,
            })
          }
        }
      } catch (err: any) {
        console.error("Error en Gemini API:", err)
      }
    }

    // 2. SI ESTÁ CONFIGURADO OPENAI GPT-4o
    if (openaiKey && (imageBase64 || rawText)) {
      try {
        const contentArr: any[] = [
          {
            type: "text",
            text: `Eres un asistente experto en facturas de supermercados colombianos.
Extrae cada producto de la factura en formato JSON con la clave "products" conteniendo un array de objetos con:
- title: nombre comercial limpio
- costCop: costo unitario en COP (número entero)
- mayorUnits: unidades por caja/paca (número entero)
- mayorLabel: etiqueta empaque (ej: "Paca x 8 uds")
- detalLabel: etiqueta unidad (ej: "Botella 1.75L")
- pasilloName: Uno de estos 6: "Bebidas y Licores", "Aseo y Hogar", "Despensa y Abarrotes", "Frutas y Verduras", "Carnes y Charcutería", "Lácteos y Huevos".`,
          },
        ]

        if (imageBase64) {
          contentArr.push({
            type: "image_url",
            image_url: { url: imageBase64 },
          })
        } else if (rawText) {
          contentArr.push({
            type: "text",
            text: `Líneas de la factura:\n${rawText}`,
          })
        }

        const oaiRes = await fetch("https://api.openai.com/v1/chat/completions", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${openaiKey}`,
          },
          body: JSON.stringify({
            model: "gpt-4o-mini",
            response_format: { type: "json_object" },
            messages: [{ role: "user", content: contentArr }],
          }),
        })

        if (oaiRes.ok) {
          const oaiData = await oaiRes.json()
          const content = oaiData.choices?.[0]?.message?.content || "{}"
          const parsed = JSON.parse(content)
          if (Array.isArray(parsed.products) && parsed.products.length > 0) {
            return res.json({
              success: true,
              provider: "OpenAI GPT-4o-mini",
              products: parsed.products,
            })
          }
        }
      } catch (err: any) {
        console.error("Error en OpenAI API:", err)
      }
    }

    // 3. FALLBACK: SI NO HAY API KEYS EN .ENV O FALLÓ LA LLAMADA, RETORNA INDICACIÓN DE USAR OCR LOCAL
    return res.json({
      success: false,
      message: "No se encontró clave de IA en .env o se usará OCR Local.",
      hasGemini: Boolean(geminiKey),
      hasOpenAI: Boolean(openaiKey),
    })
  } catch (err: any) {
    return res.status(500).json({ success: false, message: err?.message })
  }
}
