import { Suspense } from "react"

import { listLocales } from "@lib/data/locales"
import { getLocale } from "@lib/data/locale-actions"
import { listRegions } from "@lib/data/regions"
import { StoreRegion } from "@medusajs/types"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import CartButton from "@modules/layout/components/cart-button"
import Search from "@modules/layout/components/search"
import SideMenu from "@modules/layout/components/side-menu"

export default async function Nav() {
  const [regions, locales, currentLocale] = await Promise.all([
    listRegions().then((regions: StoreRegion[]) => regions),
    listLocales(),
    getLocale(),
  ])

  return (
    <div className="sticky top-0 inset-x-0 z-50">
      {/* Executive Top Ticker Strip */}
      <div className="bg-gradient-to-r from-emerald-950 via-slate-900 to-emerald-950 text-white text-[11px] sm:text-xs py-1.5 px-4 border-b border-emerald-900/50">
        <div className="content-container flex items-center justify-between">
          <div className="flex items-center gap-3">
            <span className="inline-flex items-center gap-1.5 font-bold text-emerald-400">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
              Sede Principal Abierta
            </span>
            <span className="hidden sm:inline text-slate-400">•</span>
            <span className="hidden sm:inline text-slate-300 font-medium">
              🚚 Despacho Express en 30 minutos & Despacho Mayorista Nacional
            </span>
          </div>
          <div className="flex items-center gap-4 text-slate-300">
            <a
              href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%2C%20quisiera%20hacer%20un%20pedido"
              target="_blank"
              rel="noreferrer"
              className="hover:text-emerald-300 transition-colors font-semibold flex items-center gap-1"
            >
              <span>📲 WhatsApp:</span>
              <span className="text-white font-bold">+57 300 123 4567</span>
            </a>
          </div>
        </div>
      </div>

      <header className="relative h-18 mx-auto border-b duration-200 bg-white/95 backdrop-blur-md border-slate-200/80 shadow-sm">
        <nav className="content-container flex items-center justify-between w-full h-full">
          <div className="flex-1 basis-0 h-full flex items-center gap-x-5">
            <div className="h-full flex items-center">
              <SideMenu regions={regions} locales={locales} currentLocale={currentLocale} />
            </div>
            <div className="hidden medium:flex items-center gap-x-5 text-xs font-bold text-slate-700">
              <LocalizedClientLink href="/store" className="hover:text-emerald-700 transition-colors px-2 py-1 rounded-lg hover:bg-slate-100">
                🛒 Catálogo Completo
              </LocalizedClientLink>
              <a href="#catalogo-rapido" className="hover:text-emerald-700 transition-colors px-2 py-1 rounded-lg hover:bg-slate-100">
                🏪 Pasillos
              </a>
              <a href="#mapa-sedes-colombia" className="hover:text-emerald-700 transition-colors flex items-center gap-1.5 text-emerald-800 font-extrabold bg-emerald-50 px-3 py-1 rounded-full border border-emerald-200">
                🏢 Sede Principal
              </a>
            </div>
          </div>

          <div className="flex items-center h-full">
            <LocalizedClientLink
              href="/"
              className="group flex items-center gap-2.5 py-1 px-2 rounded-xl transition-all"
              data-testid="nav-store-link"
            >
              <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-emerald-600 to-teal-800 flex items-center justify-center text-white text-xl shadow-md shadow-emerald-700/25 group-hover:scale-105 transition-transform">
                🛒
              </div>
              <div className="flex flex-col">
                <span className="text-lg sm:text-xl font-black tracking-tight text-slate-900 group-hover:text-emerald-700 transition-colors leading-none">
                  SÚPER EXPRESS
                </span>
                <span className="text-[10px] font-extrabold uppercase tracking-widest text-emerald-700 mt-0.5">
                  Mayor y Detal • Colombia
                </span>
              </div>
            </LocalizedClientLink>
          </div>

          <div className="flex items-center gap-x-3 sm:gap-x-4 h-full flex-1 basis-0 justify-end">
            <Search />
            <div className="hidden small:flex items-center gap-x-2 h-full">
              <LocalizedClientLink
                className="text-xs font-bold text-slate-700 hover:text-emerald-700 hover:bg-slate-100 px-3 py-2 rounded-xl transition-all"
                href="/account"
                data-testid="nav-account-link"
              >
                👤 Mi Cuenta
              </LocalizedClientLink>
            </div>
            <Suspense
              fallback={
                <LocalizedClientLink
                  className="bg-emerald-600 text-white font-extrabold text-xs px-4 py-2.5 rounded-xl shadow-md hover:bg-emerald-700 transition-all flex items-center gap-2"
                  href="/cart"
                  data-testid="nav-cart-link"
                >
                  🛒 Carrito (0)
                </LocalizedClientLink>
              }
            >
              <CartButton />
            </Suspense>
          </div>
        </nav>
      </header>
    </div>
  )
}
