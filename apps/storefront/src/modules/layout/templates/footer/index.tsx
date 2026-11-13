import { listCategories } from "@lib/data/categories";
import { listCollections } from "@lib/data/collections";
import { Text, clx } from "@modules/common/components/ui";

import LocalizedClientLink from "@modules/common/components/localized-client-link";
import MedusaCTA from "@modules/layout/components/medusa-cta";

export default async function Footer() {
  const [{ collections }, productCategories] = await Promise.all([
    listCollections({ fields: "id,handle,title" }),
    listCategories({
      fields:
        "id,name,handle,parent_category_id,category_children.id,category_children.name,category_children.handle",
    }),
  ]);

  return (
    <footer className="border-t border-slate-200 bg-white text-slate-800 w-full mt-10">
      {/* Payment Methods & Colombian Trust Strip */}
      <div className="bg-slate-50 border-b border-slate-200/80 py-6">
        <div className="content-container flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <span className="text-xl">🇨🇴</span>
            <div>
              <span className="text-xs font-black text-slate-900 block">
                SÚPER EXPRESS • CENTRAL MAYORISTA Y AUTOSERVICIO
              </span>
              <span className="text-[11px] text-slate-500">
                NIT: 901.452.880-9 • Registro Mercantil Colombia
              </span>
            </div>
          </div>

          <div className="flex flex-wrap items-center justify-center gap-2">
            <span className="text-xs font-bold text-slate-500 mr-1">Medios de Pago:</span>
            <span className="bg-purple-900 text-white text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              📱 Nequi
            </span>
            <span className="bg-rose-600 text-white text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              📲 Daviplata
            </span>
            <span className="bg-blue-700 text-white text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              🏦 PSE
            </span>
            <span className="bg-amber-400 text-slate-950 text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              🟡 Bancolombia
            </span>
            <span className="bg-emerald-700 text-white text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              💵 Contra Entrega
            </span>
            <span className="bg-slate-900 text-white text-xs font-black px-3 py-1 rounded-lg shadow-sm">
              💳 Tarjetas
            </span>
          </div>
        </div>
      </div>

      <div className="content-container flex flex-col w-full py-12 sm:py-16">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8 pb-10 border-b border-slate-200">
          <div className="space-y-3">
            <LocalizedClientLink
              href="/"
              className="text-xl text-slate-950 hover:text-emerald-700 uppercase font-black flex items-center gap-2"
            >
              <span className="bg-emerald-600 text-white px-2.5 py-1 rounded-xl text-base shadow-sm">🛒</span>
              SÚPER EXPRESS
            </LocalizedClientLink>
            <p className="text-xs text-slate-600 leading-relaxed font-medium">
              Tu supermercado de confianza en Colombia. Abastecimiento para hogares al detal y suministros institucionales al por mayor con precios directos de distribuidor.
            </p>
            <div className="pt-2">
              <a
                href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%20Colombia%2C%20tengo%20una%20consulta"
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 bg-[#25D366] hover:bg-[#1ebe5d] text-slate-950 text-xs font-black px-3.5 py-2 rounded-xl shadow-sm transition-transform hover:scale-105"
              >
                <span>💬 WhatsApp Atención al Cliente</span>
              </a>
            </div>
          </div>

          <div className="flex flex-col gap-y-3">
            <span className="text-xs font-black uppercase tracking-wider text-slate-900">
              🛒 Pasillos Principales
            </span>
            <ul className="grid grid-cols-1 gap-2 text-xs font-semibold text-slate-600" data-testid="footer-categories">
              {productCategories?.slice(0, 6).map((c) => (
                <li key={c.id}>
                  <LocalizedClientLink
                    className="hover:text-emerald-700 transition-colors"
                    href={`/categories/${c.handle}`}
                    data-testid="category-link"
                  >
                    • {c.name}
                  </LocalizedClientLink>
                </li>
              ))}
            </ul>
          </div>

          <div className="flex flex-col gap-y-3">
            <span className="text-xs font-black uppercase tracking-wider text-slate-900">
              ⚡ Servicios y Enlaces
            </span>
            <ul className="grid grid-cols-1 gap-2 text-xs font-semibold text-slate-600">
              <li>
                <LocalizedClientLink className="hover:text-emerald-700 transition-colors" href="/store">
                  📦 Catálogo Mayor y Detal
                </LocalizedClientLink>
              </li>
              <li>
                <a className="hover:text-emerald-700 transition-colors" href="#catalogo-rapido">
                  🔥 Ofertas del Día
                </a>
              </li>
              <li>
                <LocalizedClientLink className="hover:text-emerald-700 transition-colors" href="/cart">
                  🛒 Mi Carrito de Compras
                </LocalizedClientLink>
              </li>
              <li>
                <LocalizedClientLink className="hover:text-emerald-700 transition-colors" href="/account">
                  👤 Mi Cuenta de Usuario
                </LocalizedClientLink>
              </li>
            </ul>
          </div>

          <div className="flex flex-col gap-y-3 bg-emerald-50/70 p-4 rounded-2xl border border-emerald-200">
            <span className="text-xs font-black uppercase tracking-wider text-emerald-950 flex items-center gap-1.5">
              🏢 Sede Principal Oficial
            </span>
            <ul className="space-y-1.5 text-xs text-slate-700 font-medium">
              <li className="font-bold text-slate-900">📍 Central Mayorista y Supermercado</li>
              <li>🚚 Despacho express en 30 minutos</li>
              <li>⏰ Lunes a Sábado: 6:00 AM - 8:30 PM</li>
              <li>⏰ Domingos y Festivos: 7:00 AM - 4:00 PM</li>
              <li className="pt-1 text-emerald-800 font-extrabold">📞 +57 300 123 4567</li>
            </ul>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row w-full pt-8 justify-between items-center text-xs text-slate-500 gap-4">
          <Text className="font-medium text-center sm:text-left">
            © {new Date().getFullYear()} Súper Express Colombia. Todos los derechos reservados.
          </Text>
          <div className="flex items-center gap-4 text-xs font-bold text-slate-600">
            <span>🛡️ Frescura 100% Garantizada</span>
            <span>•</span>
            <span>🇨🇴 100% Producto Colombiano</span>
          </div>
        </div>
      </div>
    </footer>
  );
}
