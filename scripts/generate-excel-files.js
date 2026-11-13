import fs from "fs"
import path from "path"

const products = [
  {
    facturaRef: "Santander Pág 4/4 (#39)",
    barcode: "7702010123901",
    nombre: "Desodorante Rexona Women Clinical Classic Tubo 60g",
    categoria: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalPres: "Unidad Tubo 60g",
    costoUnitario: 16000,
    margenDetal: "20%",
    precioDetal: 20000,
    mayorPres: "Caja x 12",
    unidadesMayor: 12,
    costoEmpaque: 192000,
    margenMayor: "15%",
    precioMayor: 225900,
    pumMayor: 18825,
    ahorroUnidad: 1175,
    ahorroEmpaque: 14100
  },
  {
    facturaRef: "Santander Pág 4/4 (#40)",
    barcode: "7702010123918",
    nombre: "Desodorante Rexona Men Clinical Clean Tubo 60g",
    categoria: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalPres: "Unidad Tubo 60g",
    costoUnitario: 16000,
    margenDetal: "20%",
    precioDetal: 20000,
    mayorPres: "Caja x 12",
    unidadesMayor: 12,
    costoEmpaque: 192000,
    margenMayor: "15%",
    precioMayor: 225900,
    pumMayor: 18825,
    ahorroUnidad: 1175,
    ahorroEmpaque: 14100
  },
  {
    facturaRef: "Santander Pág 4/4 (#41)",
    barcode: "7702010123925",
    nombre: "Desodorante Rexona Women Clinical Classic Tubo 30g",
    categoria: "Aseo y Cuidado Personal",
    sede: "Sede Principal",
    detalPres: "Unidad Tubo 30g",
    costoUnitario: 9600,
    margenDetal: "20%",
    precioDetal: 12000,
    mayorPres: "Caja x 12",
    unidadesMayor: 12,
    costoEmpaque: 115200,
    margenMayor: "15%",
    precioMayor: 135500,
    pumMayor: 11292,
    ahorroUnidad: 708,
    ahorroEmpaque: 8500
  },
  {
    facturaRef: "Santander Pág 4/4 (#42)",
    barcode: "7702010123932",
    nombre: "Jabón Puro Hortensias y Flores Blancas Barra 180g",
    categoria: "Aseo y Hogar",
    sede: "Sede Principal",
    detalPres: "Barra 180g",
    costoUnitario: 2400,
    margenDetal: "20%",
    precioDetal: 3000,
    mayorPres: "Fardo x 25",
    unidadesMayor: 25,
    costoEmpaque: 60000,
    margenMayor: "15%",
    precioMayor: 70600,
    pumMayor: 2824,
    ahorroUnidad: 176,
    ahorroEmpaque: 4400
  },
  {
    facturaRef: "AJE Fact 1 (PTE10337)",
    barcode: "7703010103371",
    nombre: "Gaseosa Big Cola 1.75 Litros No Retornable (Paca x 8)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 1.75L",
    costoUnitario: 3200,
    margenDetal: "20%",
    precioDetal: 4000,
    mayorPres: "Paca x 8",
    unidadesMayor: 8,
    costoEmpaque: 25600,
    margenMayor: "15%",
    precioMayor: 30100,
    pumMayor: 3762,
    ahorroUnidad: 238,
    ahorroEmpaque: 1900
  },
  {
    facturaRef: "AJE Fact 1 (PTE10337-B)",
    barcode: "7703010103388",
    nombre: "Gaseosa Big Cola 1.75L - Promo Bonificada (Paca x 8)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 1.75L",
    costoUnitario: 2700,
    margenDetal: "20%",
    precioDetal: 3400,
    mayorPres: "Paca x 8",
    unidadesMayor: 8,
    costoEmpaque: 21600,
    margenMayor: "15%",
    precioMayor: 25400,
    pumMayor: 3175,
    ahorroUnidad: 225,
    ahorroEmpaque: 1800
  },
  {
    facturaRef: "AJE Fact 2 (PTE10015)",
    barcode: "7703010100158",
    nombre: "Gaseosa Big Sabor Uva 400ml PET (Paca x 12)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 400ml",
    costoUnitario: 1200,
    margenDetal: "20%",
    precioDetal: 1500,
    mayorPres: "Paca x 12",
    unidadesMayor: 12,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10036)",
    barcode: "7703010100363",
    nombre: "Bebida Cifrut Citrus Cítricos 250ml (Paca x 15)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 250ml",
    costoUnitario: 960,
    margenDetal: "20%",
    precioDetal: 1200,
    mayorPres: "Paca x 15",
    unidadesMayor: 15,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10063)",
    barcode: "7703010100639",
    nombre: "Bebida Cifrut Sabor Mora 250ml (Paca x 15)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 250ml",
    costoUnitario: 960,
    margenDetal: "20%",
    precioDetal: 1200,
    mayorPres: "Paca x 15",
    unidadesMayor: 15,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10074)",
    barcode: "7703010100745",
    nombre: "Bebida Cifrut Fruit Ponche de Frutas 250ml (Paca x 15)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 250ml",
    costoUnitario: 960,
    margenDetal: "20%",
    precioDetal: 1200,
    mayorPres: "Paca x 15",
    unidadesMayor: 15,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1127,
    ahorroUnidad: 73,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10077)",
    barcode: "7703010100776",
    nombre: "Gaseosa Big Sabor Piña Tropical 400ml (Paca x 12)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 400ml",
    costoUnitario: 1200,
    margenDetal: "20%",
    precioDetal: 1500,
    mayorPres: "Paca x 12",
    unidadesMayor: 12,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10310-B)",
    barcode: "7703010103104",
    nombre: "Agua Pura de Mesa Vida 620ml (Bonificación Paca x 20)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 620ml",
    costoUnitario: 800,
    margenDetal: "20%",
    precioDetal: 1000,
    mayorPres: "Paca x 20",
    unidadesMayor: 20,
    costoEmpaque: 16000,
    margenMayor: "15%",
    precioMayor: 18800,
    pumMayor: 940,
    ahorroUnidad: 60,
    ahorroEmpaque: 1200
  },
  {
    facturaRef: "AJE Fact 2 (PTE10351)",
    barcode: "7703010103517",
    nombre: "Gaseosa Big Sabor Manzana 400ml No Retornable (Paca x 12)",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 400ml",
    costoUnitario: 1200,
    margenDetal: "20%",
    precioDetal: 1500,
    mayorPres: "Paca x 12",
    unidadesMayor: 12,
    costoEmpaque: 14400,
    margenMayor: "15%",
    precioMayor: 16900,
    pumMayor: 1408,
    ahorroUnidad: 92,
    ahorroEmpaque: 1100
  },
  {
    facturaRef: "AJE Fact 2 (PTE10351-B)",
    barcode: "7703010103524",
    nombre: "Gaseosa Big Sabor Manzana 400ml - Promo Bonificación x 12",
    categoria: "Bebidas y Licores",
    sede: "Sede Principal",
    detalPres: "Botella 400ml",
    costoUnitario: 1000,
    margenDetal: "20%",
    precioDetal: 1250,
    mayorPres: "Paca x 12",
    unidadesMayor: 12,
    costoEmpaque: 12000,
    margenMayor: "15%",
    precioMayor: 14100,
    pumMayor: 1175,
    ahorroUnidad: 75,
    ahorroEmpaque: 900
  }
]

// 1. Generate CSV with BOM and semicolon separator (default for Excel Spanish/LatAm)
const csvHeaders = [
  "Item Factura",
  "Codigo Barras GS1 770",
  "Nombre del Producto",
  "Categoria",
  "Sede",
  "Presentacion Detal",
  "Costo Unitario (COP)",
  "Margen Detal (%)",
  "Formula Detal",
  "Precio Venta Detal (COP)",
  "Presentacion Mayor",
  "Unidades por Empaque",
  "Costo Total Empaque (COP)",
  "Margen Mayor (%)",
  "Formula Mayor",
  "Precio Venta Mayor (COP)",
  "PUM Unitario Mayor (COP)",
  "Ahorro Cliente por Unidad (COP)",
  "Ahorro Cliente por Empaque (COP)"
]

const csvRows = products.map((p, idx) => {
  const rowNum = idx + 2
  return [
    `"${p.facturaRef}"`,
    `"${p.barcode}"`,
    `"${p.nombre}"`,
    `"${p.categoria}"`,
    `"${p.sede}"`,
    `"${p.detalPres}"`,
    p.costoUnitario,
    `20%`,
    `"=G${rowNum}/(1-0.20)"`,
    p.precioDetal,
    `"${p.mayorPres}"`,
    p.unidadesMayor,
    p.costoEmpaque,
    `15%`,
    `"=(G${rowNum}*L${rowNum})/(1-0.15)"`,
    p.precioMayor,
    p.pumMayor,
    p.ahorroUnidad,
    p.ahorroEmpaque
  ].join(";")
})

const bom = "\uFEFF"
const csvContent = bom + csvHeaders.join(";") + "\r\n" + csvRows.join("\r\n")

const outCsvPath = path.resolve("c:/Users/User/Desktop/pagina wed/mi-tienda/productos_factura_santander_aje.csv")
fs.writeFileSync(outCsvPath, csvContent, "utf8")
console.log(`CSV generado: ${outCsvPath}`)

// 2. Generate HTML Excel file (.xls) that opens natively with rich styles, borders and colors
const xlsHtml = `
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <!--[if gte mso 9]>
  <xml>
    <x:ExcelWorkbook>
      <x:ExcelWorksheets>
        <x:ExcelWorksheet>
          <x:Name>Productos Facturas</x:Name>
          <x:WorksheetOptions>
            <x:DisplayGridlines/>
          </x:WorksheetOptions>
        </x:ExcelWorksheet>
      </x:ExcelWorksheets>
    </x:ExcelWorkbook>
  </xml>
  <![endif]-->
  <style>
    th { background-color: #0f172a; color: #ffffff; font-family: Segoe UI, Arial; font-size: 11pt; font-weight: bold; border: 1px solid #334155; padding: 10px; text-align: center; }
    td { font-family: Segoe UI, Arial; font-size: 10pt; border: 1px solid #cbd5e1; padding: 8px; vertical-align: middle; }
    .num { text-align: right; mso-number-format:"\\$#,##0"; }
    .center { text-align: center; }
    .barcode { text-align: center; font-family: monospace; font-weight: bold; mso-number-format:"\\@"; }
    .tag-detal { background-color: #f0fdf4; color: #166534; font-weight: bold; }
    .tag-mayor { background-color: #eff6ff; color: #1e40af; font-weight: bold; }
    .ahorro { background-color: #ecfdf5; color: #047857; font-weight: bold; }
  </style>
</head>
<body>
  <h2>LISTADO OFICIAL DE PRODUCTOS FACTURAS SANTANDER Y AJE</h2>
  <p><b>Fórmulas Industriales Aplicadas:</b> Detal = Costo / (1 - 0.20) | Mayor = (Costo × Uds) / (1 - 0.15) | Sede: Sede Principal</p>
  <table border="1" cellpadding="6" cellspacing="0">
    <thead>
      <tr>
        <th>Ítem Factura</th>
        <th>Código Barras GS1 770</th>
        <th>Nombre del Producto</th>
        <th>Categoría</th>
        <th>Sede</th>
        <th>Pres. Detal</th>
        <th>Costo Unitario COP</th>
        <th>Margen Detal</th>
        <th>Precio Venta Detal COP</th>
        <th>Pres. Mayor</th>
        <th>Uds / Empaque</th>
        <th>Costo Empaque COP</th>
        <th>Margen Mayor</th>
        <th>Precio Venta Mayor COP</th>
        <th>PUM Mayor COP</th>
        <th>Ahorro Unitario COP</th>
        <th>Ahorro Total Empaque COP</th>
      </tr>
    </thead>
    <tbody>
      ${products.map(p => `
      <tr>
        <td>${p.facturaRef}</td>
        <td class="barcode">${p.barcode}</td>
        <td><b>${p.nombre}</b></td>
        <td>${p.categoria}</td>
        <td class="center">${p.sede}</td>
        <td class="center">${p.detalPres}</td>
        <td class="num">$ ${p.costoUnitario.toLocaleString("es-CO")}</td>
        <td class="center">20%</td>
        <td class="num tag-detal">$ ${p.precioDetal.toLocaleString("es-CO")}</td>
        <td class="center">${p.mayorPres}</td>
        <td class="center">${p.unidadesMayor}</td>
        <td class="num">$ ${p.costoEmpaque.toLocaleString("es-CO")}</td>
        <td class="center">15%</td>
        <td class="num tag-mayor">$ ${p.precioMayor.toLocaleString("es-CO")}</td>
        <td class="num tag-mayor">$ ${p.pumMayor.toLocaleString("es-CO")}</td>
        <td class="num ahorro">$ ${p.ahorroUnidad.toLocaleString("es-CO")}</td>
        <td class="num ahorro">$ ${p.ahorroEmpaque.toLocaleString("es-CO")}</td>
      </tr>
      `).join("")}
    </tbody>
  </table>
</body>
</html>
`

const outXlsPath = path.resolve("c:/Users/User/Desktop/pagina wed/mi-tienda/productos_factura_santander_aje.xls")
fs.writeFileSync(outXlsPath, xlsHtml, "utf8")
console.log(`XLS generado: ${outXlsPath}`)

// 3. Generate JSON for easy programmatic access
const outJsonPath = path.resolve("c:/Users/User/Desktop/pagina wed/mi-tienda/productos_factura_santander_aje.json")
fs.writeFileSync(outJsonPath, JSON.stringify(products, null, 2), "utf8")
console.log(`JSON generado: ${outJsonPath}`)
