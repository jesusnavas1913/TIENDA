import { ArrowUpRightMini, ShoppingBag, Sparkles } from "@medusajs/icons"
import { Button, Heading } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"

const CATEGORIES_PREVIEW = [
  {
    name: "Frutas & Verduras Frescas",
    tag: "100% Orgánico",
    discount: "Hasta 25% OFF",
    bg: "from-emerald-600 to-teal-800",
    emoji: "🥑",
    href: "/store",
  },
  {
    name: "Despensa & Abarrotes",
    tag: "Básicos del Hogar",
    discount: "Precios Bajos",
    bg: "from-amber-500 to-orange-700",
    emoji: "🛒",
    href: "/store",
  },
  {
    name: "Bebidas, Snacks & Lácteos",
    tag: "Entrega Express",
    discount: "3x2 Seleccionados",
    bg: "from-indigo-600 to-slate-900",
    emoji: "🥤",
    href: "/store",
  },
  {
    name: "Moda & Esenciales",
    tag: "Colección Medusa",
    discount: "Nuevo Ingreso",
    bg: "from-rose-600 to-pink-800",
    emoji: "👕",
    href: "/store",
  },
]

const Hero = () => {
  return (
    <div className="w-full bg-slate-50 border-b border-ui-border-base">
      {/* Top Promotional Strip */}
      <div className="bg-emerald-700 text-white text-xs sm:text-sm py-2.5 px-4 text-center font-medium tracking-wide">
        🚚 <strong>ENVÍO GRATIS</strong> en pedidos superiores a €30 • Entrega rápida en 30 minutos • Frescura garantizada
      </div>

      {/* Main Hero Banner */}
      <div className="content-container py-8 small:py-12">
        <div className="relative rounded-3xl overflow-hidden bg-gradient-to-br from-slate-900 via-emerald-950 to-teal-900 text-white shadow-2xl border border-emerald-800/40">
          <div className="grid grid-cols-1 small:grid-cols-12 items-center p-8 small:p-14 gap-8">
            <div className="small:col-span-7 flex flex-col items-start text-left gap-6 z-10">
              <div className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 text-xs font-semibold uppercase tracking-wider">
                <Sparkles className="w-4 h-4" /> Supermercado & Autoservicio Online
              </div>

              <Heading
                level="h1"
                className="text-4xl small:text-6xl font-extrabold leading-tight tracking-tight text-white"
              >
                Todo tu mercado,{" "}
                <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-teal-200">
                  fresco y directo
                </span>{" "}
                a tu puerta.
              </Heading>

              <p className="text-slate-300 text-base small:text-lg max-w-xl leading-relaxed">
                Compra fácil y rápido en nuestro autoservicio digital. Productos seleccionados, ofertas todos los días y pago seguro en un solo lugar.
              </p>

              <div className="flex flex-wrap items-center gap-4 pt-2">
                <LocalizedClientLink href="/store">
                  <Button
                    size="large"
                    className="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-7 py-3.5 rounded-xl shadow-lg shadow-emerald-500/25 border-none transition-all"
                  >
                    <ShoppingBag /> Comprar Ahora
                  </Button>
                </LocalizedClientLink>
                <a href="#catalogo-rapido">
                  <Button
                    variant="secondary"
                    size="large"
                    className="bg-white/10 hover:bg-white/20 text-white border-white/20 px-6 py-3.5 rounded-xl backdrop-blur-sm"
                  >
                    Ver Ofertas del Día <ArrowUpRightMini />
                  </Button>
                </a>
              </div>

              {/* Trust Badges */}
              <div className="grid grid-cols-3 gap-6 pt-6 border-t border-white/10 w-full max-w-lg text-xs sm:text-sm text-slate-300">
                <div>
                  <span className="block text-emerald-400 font-bold text-lg">⚡ 30 min</span>
                  Entrega express local
                </div>
                <div>
                  <span className="block text-emerald-400 font-bold text-lg">🥬 100%</span>
                  Calidad garantizada
                </div>
                <div>
                  <span className="block text-emerald-400 font-bold text-lg">🔒 Seguro</span>
                  Compra sin complicaciones
                </div>
              </div>
            </div>

            {/* Right Visual Showcase */}
            <div className="small:col-span-5 grid grid-cols-2 gap-4 z-10">
              {CATEGORIES_PREVIEW.map((cat, idx) => (
                <LocalizedClientLink
                  key={idx}
                  href={cat.href}
                  className={`group relative rounded-2xl p-5 bg-gradient-to-br ${cat.bg} shadow-lg hover:scale-[1.03] transition-all duration-200 flex flex-col justify-between min-h-[145px] border border-white/15`}
                >
                  <div className="flex justify-between items-start">
                    <span className="text-3xl">{cat.emoji}</span>
                    <span className="text-[11px] font-bold bg-black/30 backdrop-blur-md text-white px-2.5 py-1 rounded-full">
                      {cat.discount}
                    </span>
                  </div>
                  <div className="mt-4">
                    <p className="text-[11px] uppercase tracking-wider text-white/80 font-medium">
                      {cat.tag}
                    </p>
                    <h3 className="text-sm sm:text-base font-bold text-white leading-snug group-hover:underline">
                      {cat.name}
                    </h3>
                  </div>
                </LocalizedClientLink>
              ))}
            </div>
          </div>
        </div>

        {/* Service Highlights Bar */}
        <div className="grid grid-cols-2 small:grid-cols-4 gap-4 mt-8">
          <div className="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm flex items-center gap-3.5">
            <span className="text-2xl bg-emerald-50 p-3 rounded-xl">🛵</span>
            <div>
              <h4 className="font-bold text-slate-900 text-sm">Envío a Domicilio</h4>
              <p className="text-xs text-slate-500">Rápido en toda tu zona</p>
            </div>
          </div>
          <div className="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm flex items-center gap-3.5">
            <span className="text-2xl bg-amber-50 p-3 rounded-xl">🏷️</span>
            <div>
              <h4 className="font-bold text-slate-900 text-sm">Precios de Autoservicio</h4>
              <p className="text-xs text-slate-500">Ahorra en cada compra</p>
            </div>
          </div>
          <div className="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm flex items-center gap-3.5">
            <span className="text-2xl bg-blue-50 p-3 rounded-xl">❄️</span>
            <div>
              <h4 className="font-bold text-slate-900 text-sm">Cadena de Frío</h4>
              <p className="text-xs text-slate-500">Frescura intacta siempre</p>
            </div>
          </div>
          <div className="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm flex items-center gap-3.5">
            <span className="text-2xl bg-purple-50 p-3 rounded-xl">💳</span>
            <div>
              <h4 className="font-bold text-slate-900 text-sm">Pago Fácil</h4>
              <p className="text-xs text-slate-500">Tarjetas y contraentrega</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Hero
