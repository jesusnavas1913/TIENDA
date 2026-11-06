import { ArrowUpRightMini, ShoppingBag, Sparkles } from "@medusajs/icons"
import { Button, Heading } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"

const DEPARTMENTS_SHOWCASE = [
  {
    name: "Frutas y Verduras",
    tag: "Del Campo • Mayor y Detal",
    discount: "Canastillas -20%",
    bg: "from-emerald-600 to-teal-800",
    emoji: "🥑",
    href: "#pasillo-Frutas y Verduras",
  },
  {
    name: "Despensa y Abarrotes",
    tag: "Arroz, Aceite, Café y Pan",
    discount: "Pacas Mayoristas",
    bg: "from-amber-500 to-orange-700",
    emoji: "🌾",
    href: "#pasillo-Despensa y Abarrotes",
  },
  {
    name: "Carnes, Lácteos y Huevos",
    tag: "Cadena de Frío Garantizada",
    discount: "Precios Distribuidor",
    bg: "from-rose-600 to-red-900",
    emoji: "🥩",
    href: "#pasillo-Carnes y Charcutería",
  },
  {
    name: "Bebidas, Aseo y Hogar",
    tag: "Fardos y Unidades",
    discount: "Ahorro Total",
    bg: "from-blue-600 to-indigo-900",
    emoji: "🧼",
    href: "#pasillo-Aseo y Hogar",
  },
]

const Hero = () => {
  return (
    <div className="w-full bg-slate-50 border-b border-ui-border-base">
      {/* Top Promotional Strip */}
      <div className="bg-emerald-800 text-white text-xs sm:text-sm py-2.5 px-4 text-center font-medium tracking-wide flex flex-wrap items-center justify-center gap-2">
        <span className="bg-amber-400 text-slate-950 font-extrabold px-2 py-0.5 rounded text-[11px] uppercase">
          VENTA AL POR MAYOR Y AL DETAL
        </span>
        <span>
          🚚 <strong>ENVÍO GRATIS</strong> desde €30 • Surtimos tu hogar, restaurante o negocio con precios de central mayorista
        </span>
      </div>

      {/* Main Hero Banner */}
      <div className="content-container py-8 small:py-10">
        <div className="relative rounded-3xl overflow-hidden bg-gradient-to-br from-slate-900 via-emerald-950 to-teal-900 text-white shadow-2xl border border-emerald-800/40">
          <div className="grid grid-cols-1 small:grid-cols-12 items-center p-7 small:p-12 gap-8">
            <div className="small:col-span-7 flex flex-col items-start text-left gap-5 z-10">
              <div className="inline-flex flex-wrap items-center gap-2">
                <span className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 text-xs font-bold uppercase tracking-wider">
                  <Sparkles className="w-4 h-4" /> Supermercado & Distribuidora
                </span>
                <span className="inline-flex items-center gap-1 px-3 py-1.5 rounded-full bg-amber-500/20 border border-amber-400/30 text-amber-300 text-xs font-bold uppercase tracking-wider">
                  📦 Mayorista y Detal
                </span>
              </div>

              <Heading
                level="h1"
                className="text-3xl sm:text-5xl font-extrabold leading-tight tracking-tight text-white"
              >
                Tu mercado completo{" "}
                <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-amber-300">
                  por Unidad o por Caja Mayorista
                </span>
              </Heading>

              <p className="text-slate-300 text-sm sm:text-base max-w-xl leading-relaxed">
                100% productos reales de supermercado organizados por departamento. Cambia en un clic entre{" "}
                <strong className="text-white">Compra al Detal (Hogar)</strong> y{" "}
                <strong className="text-amber-300">Compra al por Mayor (Cajas / Pacas / Bultos)</strong> con descuento directo.
              </p>

              <div className="flex flex-wrap items-center gap-3 pt-1">
                <a href="#catalogo-rapido">
                  <Button
                    size="large"
                    className="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-6 py-3.5 rounded-xl shadow-lg shadow-emerald-500/25 border-none transition-all"
                  >
                    <ShoppingBag /> Ver Pasillos (Mayor y Detal)
                  </Button>
                </a>
                <LocalizedClientLink href="/store">
                  <Button
                    variant="secondary"
                    size="large"
                    className="bg-white/10 hover:bg-white/20 text-white border-white/20 px-6 py-3.5 rounded-xl backdrop-blur-sm"
                  >
                    Catálogo Completo <ArrowUpRightMini />
                  </Button>
                </LocalizedClientLink>
              </div>

              {/* Trust Badges */}
              <div className="grid grid-cols-3 gap-4 pt-5 border-t border-white/10 w-full max-w-lg text-xs text-slate-300">
                <div>
                  <span className="block text-emerald-400 font-extrabold text-base">🛍️ Al Detal</span>
                  Unidades para tu casa
                </div>
                <div>
                  <span className="block text-amber-400 font-extrabold text-base">📦 Al por Mayor</span>
                  Cajas, pacas y bultos
                </div>
                <div>
                  <span className="block text-emerald-400 font-extrabold text-base">⚡ 30 min</span>
                  Despacho inmediato
                </div>
              </div>
            </div>

            {/* Right Visual Showcase */}
            <div className="small:col-span-5 grid grid-cols-2 gap-3.5 z-10">
              {DEPARTMENTS_SHOWCASE.map((cat, idx) => (
                <a
                  key={idx}
                  href={cat.href}
                  className={`group relative rounded-2xl p-4 sm:p-5 bg-gradient-to-br ${cat.bg} shadow-lg hover:scale-[1.03] transition-all duration-200 flex flex-col justify-between min-h-[140px] border border-white/15`}
                >
                  <div className="flex justify-between items-start">
                    <span className="text-3xl">{cat.emoji}</span>
                    <span className="text-[10px] font-bold bg-black/35 backdrop-blur-md text-white px-2.5 py-1 rounded-full">
                      {cat.discount}
                    </span>
                  </div>
                  <div className="mt-3">
                    <p className="text-[10px] uppercase tracking-wider text-white/80 font-semibold">
                      {cat.tag}
                    </p>
                    <h3 className="text-sm sm:text-base font-extrabold text-white leading-snug group-hover:underline mt-0.5">
                      {cat.name}
                    </h3>
                  </div>
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Hero
