import React from "react"

const Hero = () => {
  return (
    <div className="bg-gradient-to-r from-emerald-950 via-slate-900 to-emerald-950 text-white py-6 border-b border-emerald-900/40">
      <div className="content-container flex flex-col sm:flex-row items-center justify-between gap-4">
        <div>
          <div className="inline-flex items-center gap-2 text-xs font-bold text-emerald-400 mb-1">
            <span>🇨🇴</span> SÚPER EXPRESS COLOMBIA • SEDE PRINCIPAL
          </div>
          <h1 className="text-xl sm:text-2xl font-black text-white tracking-tight">
            Supermercado Online <span className="text-emerald-400">Al Detal y Al por Mayor</span>
          </h1>
          <p className="text-xs text-slate-300 mt-0.5">
            Precios directos de central de abastos con despacho express en 30 minutos a tu puerta o negocio.
          </p>
        </div>

        <div className="flex items-center gap-3 shrink-0">
          <div className="text-right hidden md:block">
            <div className="text-xs font-bold text-amber-300">📦 Precios Mayoristas (-15%)</div>
            <div className="text-[11px] text-slate-400">Pacas, Cajas y Bultos</div>
          </div>
          <a
            href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%2C%20quisiera%20hacer%20un%20pedido"
            target="_blank"
            rel="noreferrer"
            className="px-4 py-2 rounded-xl text-xs font-bold bg-emerald-600 hover:bg-emerald-500 text-white transition flex items-center gap-1.5 shadow"
          >
            <span>📲 WhatsApp</span>
          </a>
        </div>
      </div>
    </div>
  )
}

export default Hero
