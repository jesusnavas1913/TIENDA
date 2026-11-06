import React from "react"

const BRANCHES = [
  {
    city: "Bogotá D.C.",
    name: "Sede Principal Corabastos & Cedritos",
    address: "Av. Carrera 80 # 2-51 / Calle 140 # 15-22",
    hours: "Lunes a Domingo: 6:00 AM - 10:00 PM",
    coverage: "Chapinero, Usaquén, Suba, Kennedy, Engativá y Soacha",
    phone: "+57 (601) 580-9000",
    type: "Central Mayorista y Punto Detal",
    mapEmbed:
      "https://www.openstreetmap.org/export/embed.html?bbox=-74.165%2C4.605%2C-74.035%2C4.715&layer=mapnik&marker=4.6533%2C-74.0836",
  },
  {
    city: "Medellín",
    name: "Sede Central Mayorista & El Poblado",
    address: "Calle 85 # 48-01 Itagüí / Carrera 43A # 10-50",
    hours: "Lunes a Domingo: 6:00 AM - 9:30 PM",
    coverage: "El Poblado, Laureles, Envigado, Sabaneta, Itagüí y Bello",
    phone: "+57 (604) 444-8500",
    type: "Bodega Mayorista y Supermercado",
    mapEmbed:
      "https://www.openstreetmap.org/export/embed.html?bbox=-75.620%2C6.165%2C-75.540%2C6.275&layer=mapnik&marker=6.2442%2C-75.5812",
  },
  {
    city: "Cali",
    name: "Sede Cavasa & Ciudad Jardín",
    address: " Avenida Pasoancho # 66-15 / Calle 18 # 105-30",
    hours: "Lunes a Sábado: 6:30 AM - 9:00 PM",
    coverage: "Sur, Norte, Oeste, Jamundí, Yumbo y Palmira",
    phone: "+57 (602) 380-7200",
    type: "Centro de Distribución Valle",
    mapEmbed:
      "https://www.openstreetmap.org/export/embed.html?bbox=-76.575%2C3.375%2C-76.495%2C3.485&layer=mapnik&marker=3.4516%2C-76.5320",
  },
  {
    city: "Barranquilla",
    name: "Sede Granabastos & Alto Prado",
    address: "Carrera 51B # 82-120 / Vía Circunvalar",
    hours: "Lunes a Domingo: 6:30 AM - 9:00 PM",
    coverage: "Norte Centro Histórico, Riomar, Soledad y Puerto Colombia",
    phone: "+57 (605) 310-6400",
    type: "Bodega Costa Caribe",
    mapEmbed:
      "https://www.openstreetmap.org/export/embed.html?bbox=-74.845%2C10.955%2C-74.765%2C11.035&layer=mapnik&marker=10.9878%2C-74.7889",
  },
]

const StoreLocatorColombia = () => {
  return (
    <section
      id="mapa-sedes-colombia"
      className="w-full bg-white border-t border-slate-200 py-14"
    >
      <div className="content-container">
        {/* Section Header */}
        <div className="flex flex-col small:flex-row small:items-end justify-between gap-6 mb-10">
          <div>
            <div className="inline-flex items-center gap-2 bg-amber-100 text-amber-900 border border-amber-300 px-3 py-1 rounded-full text-xs font-extrabold uppercase tracking-wider mb-2">
              🇨🇴 Cobertura Nacional en Colombia
            </div>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900">
              Mapa de Sedes, Bodegas Mayoristas y Cobertura
            </h2>
            <p className="text-slate-600 text-sm sm:text-base mt-1 max-w-2xl">
              Compra en línea con despacho a domicilio en <strong>30 minutos</strong> o recoge tu pedido mayorista directamente en nuestras sedes de Bogotá, Medellín, Cali y Barranquilla.
            </p>
          </div>

          {/* Colombian Payment Methods Badge */}
          <div className="bg-slate-50 border border-slate-200 rounded-2xl p-4 flex flex-col gap-1.5 shrink-0">
            <span className="text-[11px] font-bold uppercase tracking-wider text-slate-500">
              Medios de Pago en Colombia:
            </span>
            <div className="flex flex-wrap items-center gap-2 text-xs font-extrabold">
              <span className="bg-purple-900 text-white px-2.5 py-1 rounded-lg">
                📱 Nequi
              </span>
              <span className="bg-rose-600 text-white px-2.5 py-1 rounded-lg">
                📲 Daviplata
              </span>
              <span className="bg-blue-700 text-white px-2.5 py-1 rounded-lg">
                🏦 PSE / Bancolombia
              </span>
              <span className="bg-emerald-700 text-white px-2.5 py-1 rounded-lg">
                💵 Efectivo Contraentrega
              </span>
            </div>
          </div>
        </div>

        {/* Branches & Interactive Maps Grid */}
        <div className="grid grid-cols-1 small:grid-cols-2 gap-6">
          {BRANCHES.map((branch) => (
            <div
              key={branch.city}
              className="rounded-3xl border border-slate-200 bg-slate-50/60 overflow-hidden shadow-sm hover:shadow-lg transition-all flex flex-col"
            >
              {/* Interactive OpenStreetMap Iframe */}
              <div className="relative h-52 w-full bg-slate-200 border-b border-slate-200">
                <iframe
                  title={`Mapa ${branch.city}`}
                  src={branch.mapEmbed}
                  className="w-full h-full border-0"
                  loading="lazy"
                />
                <span className="absolute top-3 left-3 bg-slate-900/90 text-white text-xs font-extrabold px-3 py-1 rounded-full backdrop-blur-md">
                  📍 {branch.city}
                </span>
                <span className="absolute top-3 right-3 bg-emerald-600 text-white text-[11px] font-bold px-2.5 py-1 rounded-full shadow">
                  {branch.type}
                </span>
              </div>

              {/* Branch Details */}
              <div className="p-5 flex-1 flex flex-col justify-between gap-4">
                <div className="space-y-2">
                  <h3 className="text-lg font-extrabold text-slate-900">
                    {branch.name}
                  </h3>
                  <p className="text-xs sm:text-sm text-slate-600 flex items-center gap-2">
                    <span>🏢</span>
                    <span>
                      <strong>Dirección:</strong> {branch.address}
                    </span>
                  </p>
                  <p className="text-xs sm:text-sm text-slate-600 flex items-center gap-2">
                    <span>🕒</span>
                    <span>
                      <strong>Horario:</strong> {branch.hours}
                    </span>
                  </p>
                  <p className="text-xs sm:text-sm text-slate-600 flex items-center gap-2">
                    <span>🛵</span>
                    <span>
                      <strong>Zonas de Domicilio:</strong> {branch.coverage}
                    </span>
                  </p>
                </div>

                <div className="pt-3 border-t border-slate-200/80 flex items-center justify-between gap-2">
                  <span className="text-xs font-bold text-slate-700">
                    📞 {branch.phone}
                  </span>
                  <div className="flex items-center gap-2">
                    <a
                      href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(
                        `${branch.address}, ${branch.city}, Colombia`
                      )}`}
                      target="_blank"
                      rel="noreferrer"
                      className="text-xs font-extrabold bg-white hover:bg-slate-900 text-slate-800 hover:text-white border border-slate-300 px-3 py-1.5 rounded-xl transition-colors"
                    >
                      🗺️ Cómo llegar
                    </a>
                    <a
                      href={`https://wa.me/573000000000?text=${encodeURIComponent(
                        `Hola Súper Express Colombia, quiero hacer un pedido en la sede de ${branch.city}`
                      )}`}
                      target="_blank"
                      rel="noreferrer"
                      className="text-xs font-extrabold bg-emerald-600 hover:bg-emerald-500 text-white px-3 py-1.5 rounded-xl transition-colors"
                    >
                      💬 Pedir por WhatsApp
                    </a>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Floating WhatsApp Order Assistant Button */}
      <a
        href="https://wa.me/573000000000?text=Hola%20S%C3%BAper%20Express%20Colombia%2C%20quiero%20cotizar%20un%20pedido%20al%20por%20mayor%20%2F%20detal"
        target="_blank"
        rel="noreferrer"
        className="fixed bottom-6 right-6 z-50 bg-emerald-600 hover:bg-emerald-500 text-white font-extrabold text-xs sm:text-sm px-4 py-3 rounded-full shadow-2xl border-2 border-white flex items-center gap-2 hover:scale-105 transition-transform"
      >
        <span className="text-lg">💬</span>
        <span>Atención Colombia (Mayor y Detal)</span>
      </a>
    </section>
  )
}

export default StoreLocatorColombia

