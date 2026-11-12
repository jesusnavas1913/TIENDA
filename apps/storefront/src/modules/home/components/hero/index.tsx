import { ArrowUpRightMini, ShoppingBag, Sparkles } from "@medusajs/icons"
import { Button, Heading } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"

const VALUE_PILLARS = [
  {
    icon: "⚡",
    title: "Entrega Express 30 Min",
    desc: "Despachos inmediatos con cadena de frío garantizada a tu puerta o negocio.",
    badge: "Rapidez Garantizada",
    bg: "from-emerald-900/40 to-slate-900/60 border-emerald-500/30",
  },
  {
    icon: "📦",
    title: "Ahorro Mayorista hasta 35%",
    desc: "Compra por caja, paca o bulto con indicador PUM de ahorro real por unidad.",
    badge: "Precios de Fábrica",
    bg: "from-amber-900/40 to-slate-900/60 border-amber-500/30",
  },
  {
    icon: "🥦",
    title: "100% Calidad y Frescura",
    desc: "Productos seleccionados directamente del campo colombiano a tu mesa.",
    badge: "Garantía Total",
    bg: "from-teal-900/40 to-slate-900/60 border-teal-500/30",
  },
  {
    icon: "📱",
    title: "Pagos Contraentrega & Apps",
    desc: "Paga al recibir en efectivo, o transfiere fácil por Nequi, Daviplata y PSE.",
    badge: "100% Seguro",
    bg: "from-blue-900/40 to-slate-900/60 border-blue-500/30",
  },
]

const Hero = () => {
  return (
    <div className="w-full bg-slate-900 border-b border-slate-800">
      {/* Main Executive Hero Banner */}
      <div className="relative overflow-hidden bg-gradient-to-b from-slate-950 via-emerald-950/90 to-slate-900 text-white py-12 sm:py-16">
        {/* Subtle decorative glow circles */}
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none"></div>
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-amber-500/10 rounded-full blur-3xl pointer-events-none"></div>

        <div className="content-container relative z-10">
          <div className="max-w-4xl mx-auto text-center flex flex-col items-center gap-6">
            {/* Top Executive Pill */}
            <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-emerald-500/15 border border-emerald-400/30 text-emerald-300 text-xs sm:text-sm font-extrabold shadow-sm backdrop-blur-md">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-ping"></span>
              🇨🇴 SÚPER EXPRESS COLOMBIA • CENTRAL MAYORISTA & AUTOSERVICIO
            </div>

            {/* Main Punchy Heading */}
            <Heading
              level="h1"
              className="text-4xl sm:text-6xl font-black leading-tight sm:leading-none tracking-tight text-white"
            >
              El supermercado líder en{" "}
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 via-teal-300 to-amber-300">
                Venta al Detal y al por Mayor
              </span>
            </Heading>

            {/* Subheading */}
            <p className="text-slate-300 text-base sm:text-lg max-w-2xl leading-relaxed font-normal">
              Abastece tu hogar o surte tu negocio con los mejores precios de Colombia. Productos frescos, abarrotes, carnes y aseo con <strong className="text-white">entrega express en 30 minutos</strong> o recogida en nuestra <strong className="text-emerald-400">Sede Principal</strong>.
            </p>

            {/* Interactive Call to Action Buttons */}
            <div className="flex flex-wrap items-center justify-center gap-3.5 pt-2">
              <a href="#catalogo-rapido">
                <Button
                  size="large"
                  className="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-black text-sm sm:text-base px-8 py-4 rounded-2xl shadow-xl shadow-emerald-500/30 border-none transition-all hover:scale-105 active:scale-95 flex items-center gap-2"
                >
                  <ShoppingBag className="w-5 h-5" /> Explorar Catálogo Mayor y Detal
                </Button>
              </a>
              <a
                href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%2C%20quisiera%20solicitar%20una%20cotizaci%C3%B3n%20mayorista"
                target="_blank"
                rel="noreferrer"
              >
                <Button
                  variant="secondary"
                  size="large"
                  className="bg-white/10 hover:bg-white/20 text-white font-bold text-sm sm:text-base border border-white/20 px-6 py-4 rounded-2xl backdrop-blur-md transition-all hover:scale-105 flex items-center gap-2"
                >
                  📲 Cotizar por WhatsApp <ArrowUpRightMini className="w-4 h-4" />
                </Button>
              </a>
            </div>

            {/* Quick Sede & Guarantee Bar */}
            <div className="flex flex-wrap items-center justify-center gap-6 pt-4 text-xs font-bold text-slate-400">
              <span className="flex items-center gap-1.5 text-emerald-300">
                🏢 Sede Principal: Central Mayorista Oficial
              </span>
              <span className="hidden sm:inline">•</span>
              <span className="flex items-center gap-1.5 text-amber-300">
                🏷️ Fórmulas Industriales: Margen 20% Detal / 15% Mayor
              </span>
              <span className="hidden sm:inline">•</span>
              <span className="flex items-center gap-1.5 text-teal-300">
                💵 Paga Contra Entrega, Nequi y Daviplata
              </span>
            </div>
          </div>

          {/* 4 Interactive Executive Pillars */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mt-12">
            {VALUE_PILLARS.map((p, idx) => (
              <div
                key={idx}
                className={`rounded-2xl p-5 bg-gradient-to-br ${p.bg} border backdrop-blur-sm shadow-md hover:shadow-xl hover:-translate-y-1 transition-all duration-300 flex flex-col justify-between`}
              >
                <div className="flex items-start justify-between mb-3">
                  <span className="text-3xl p-2.5 rounded-xl bg-white/10 shadow-inner">
                    {p.icon}
                  </span>
                  <span className="text-[10px] font-black uppercase tracking-wider bg-white/15 text-white px-2.5 py-0.5 rounded-full border border-white/10">
                    {p.badge}
                  </span>
                </div>
                <div>
                  <h3 className="text-base font-black text-white leading-snug mb-1">
                    {p.title}
                  </h3>
                  <p className="text-xs text-slate-300 leading-relaxed font-medium">
                    {p.desc}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

export default Hero
