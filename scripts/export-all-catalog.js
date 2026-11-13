import fs from "fs"
import path from "path"

async function exportCompleteCatalog() {
  const key = "pk_89ef881f192f2ba8c6b88c5ddd7c1375f3e75cdb8d19022573cb47acff358187"
  const res = await fetch("http://localhost:9000/store/products?limit=100&fields=*categories,*variants.prices", {
    headers: { "x-publishable-api-key": key },
  })
  const data = await res.json()
  const prods = data.products || []

  console.log(`Exportando ${prods.length} productos completos de la tienda...`)

  const rows = prods.map((p, idx) => {
    const meta = p.metadata || {}
    const variants = p.variants || []
    const detalVar = variants.find(v => v.title?.toLowerCase().includes("detal")) || variants[0]
    const mayorVar = variants.find(v => v.title?.toLowerCase().includes("mayor")) || variants[1]

    const getCop = (v) => {
      const pr = v?.prices?.find(x => x.currency_code?.toLowerCase() === "cop")
      return pr?.amount || 0
    }

    const detalPrice = getCop(detalVar)
    const mayorPrice = getCop(mayorVar)
    const cost = Number(meta.cost_cop) || Math.round(detalPrice * 0.80)
    const dMargin = Number(meta.detal_margin_pct || 20)
    const mMargin = Number(meta.mayor_margin_pct || 15)
    const units = Number(meta.mayor_units || 10)
    const pum = units > 0 ? Math.round(mayorPrice / units) : detalPrice
    const ahorroUnidad = Math.max(0, detalPrice - pum)
    const ahorroEmpaque = ahorroUnidad * units
    const catName = p.categories?.[0]?.name || "General"
    const barcode = meta.barcode || detalVar?.barcode || `770${idx}0001`

    return {
      barcode,
      title: p.title,
      catName,
      sede: meta.sede || "Sede Principal",
      detalLabel: meta.detal_label || "Unidad",
      cost,
      dMargin: `${dMargin}%`,
      detalPrice,
      mayorLabel: meta.mayor_label || `Empaque x ${units}`,
      units,
      mMargin: `${mMargin}%`,
      mayorPrice,
      pum,
      ahorroUnidad,
      ahorroEmpaque,
    }
  })

  // 1. CSV
  const csvHeaders = [
    "Codigo GS1 770",
    "Nombre del Producto",
    "Departamento / Categoria",
    "Sede",
    "Presentacion Detal",
    "Costo Unitario COP",
    "Margen Detal",
    "Precio Venta Detal COP",
    "Presentacion Mayor",
    "Unidades x Empaque",
    "Margen Mayor",
    "Precio Venta Mayor COP",
    "PUM Mayor COP",
    "Ahorro Cliente x Unidad COP",
    "Ahorro Cliente x Empaque COP",
  ]

  const csvRows = rows.map(r => [
    `"${r.barcode}"`,
    `"${r.title}"`,
    `"${r.catName}"`,
    `"${r.sede}"`,
    `"${r.detalLabel}"`,
    r.cost,
    `"${r.dMargin}"`,
    r.detalPrice,
    `"${r.mayorLabel}"`,
    r.units,
    `"${r.mMargin}"`,
    r.mayorPrice,
    r.pum,
    r.ahorroUnidad,
    r.ahorroEmpaque,
  ].join(";"))

  const bom = "\uFEFF"
  const csvContent = bom + csvHeaders.join(";") + "\r\n" + csvRows.join("\r\n")
  const outCsv = path.resolve("c:/Users/User/Desktop/pagina wed/mi-tienda/catalogo_completo_supermercado.csv")
  fs.writeFileSync(outCsv, csvContent, "utf8")

  // 2. XLS
  const xlsHtml = `
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style>
    th { background-color: #047857; color: #ffffff; font-family: Segoe UI, Arial; font-size: 11pt; font-weight: bold; border: 1px solid #065f46; padding: 8px; text-align: center; }
    td { font-family: Segoe UI, Arial; font-size: 10pt; border: 1px solid #cbd5e1; padding: 6px 8px; }
    .num { text-align: right; }
    .center { text-align: center; }
    .cat { font-weight: bold; color: #065f46; }
  </style>
</head>
<body>
  <h2>SUPERMERCADO SÚPER EXPRESS - CATÁLOGO MAESTRO COMPLETO (38 REFERENCIAS)</h2>
  <p>Verduras, Carnes, Arroces, Víveres, Granos, Lácteos, Aseo y Bebidas • Sede Principal</p>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Código GS1 770</th>
        <th>Nombre del Producto</th>
        <th>Departamento / Categoría</th>
        <th>Sede</th>
        <th>Pres. Detal</th>
        <th>Costo COP</th>
        <th>Margen Detal</th>
        <th>Precio Detal COP</th>
        <th>Pres. Mayor</th>
        <th>Uds x Empaque</th>
        <th>Margen Mayor</th>
        <th>Precio Mayor COP</th>
        <th>PUM Mayor COP</th>
        <th>Ahorro Unitario COP</th>
      </tr>
    </thead>
    <tbody>
      ${rows.map(r => `
      <tr>
        <td class="center font-mono"><b>${r.barcode}</b></td>
        <td><b>${r.title}</b></td>
        <td class="cat">${r.catName}</td>
        <td class="center">${r.sede}</td>
        <td class="center">${r.detalLabel}</td>
        <td class="num">$ ${r.cost.toLocaleString("es-CO")}</td>
        <td class="center">${r.dMargin}</td>
        <td class="num" style="background:#ecfdf5;font-weight:bold;color:#065f46;">$ ${r.detalPrice.toLocaleString("es-CO")}</td>
        <td class="center">${r.mayorLabel}</td>
        <td class="center">${r.units}</td>
        <td class="center">${r.mMargin}</td>
        <td class="num" style="background:#eff6ff;font-weight:bold;color:#1e40af;">$ ${r.mayorPrice.toLocaleString("es-CO")}</td>
        <td class="num">$ ${r.pum.toLocaleString("es-CO")}</td>
        <td class="num" style="color:#059669;font-weight:bold;">+$ ${r.ahorroUnidad.toLocaleString("es-CO")}</td>
      </tr>
      `).join("")}
    </tbody>
  </table>
</body>
</html>
`
  const outXls = path.resolve("c:/Users/User/Desktop/pagina wed/mi-tienda/catalogo_completo_supermercado.xls")
  fs.writeFileSync(outXls, xlsHtml, "utf8")

  console.log(`✅ Archivos generados:\n- ${outCsv}\n- ${outXls}`)
}

exportCompleteCatalog().catch(console.error)
