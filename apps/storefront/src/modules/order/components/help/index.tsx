import { Heading } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"
import React from "react"

const Help = () => {
  return (
    <div className="mt-6 bg-gray-50 border border-gray-200 rounded-xl p-4">
      <Heading className="text-base-semi font-bold text-gray-900">
        ¿Necesitas ayuda con tu pedido o despacho mayorista?
      </Heading>
      <div className="text-base-regular my-2">
        <ul className="gap-y-2 flex flex-col">
          <li>
            <a
              href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%2C%20acabo%20de%20hacer%20un%20pedido%20y%20tengo%20una%20consulta"
              target="_blank"
              rel="noreferrer"
              className="text-emerald-700 hover:text-emerald-900 font-bold underline"
            >
              📲 Contactar Central Mayorista por WhatsApp (+57 300 123 4567)
            </a>
          </li>
          <li>
            <LocalizedClientLink href="/store" className="text-gray-700 hover:text-emerald-700 underline">
              🛡️ Garantía de Frescura, Cambios y Devoluciones
            </LocalizedClientLink>
          </li>
        </ul>
      </div>
    </div>
  )
}

export default Help
