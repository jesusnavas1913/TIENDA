import { Metadata } from "next"
import { notFound } from "next/navigation"

import { listProducts } from "@lib/data/products"
import { getRegion } from "@lib/data/regions"
import QuickSupermarketCatalog from "@modules/home/components/quick-catalog"

export const dynamic = "force-dynamic"

export const metadata: Metadata = {
  title: "Catálogo | Súper Express",
  description: "Explora todos los productos frescos y de despensa de nuestro autoservicio.",
}

export default async function StorePage(props: {
  params: Promise<{ countryCode: string }>
}) {
  const { countryCode } = await props.params
  const region = await getRegion(countryCode)

  if (!region) {
    notFound()
  }

  const {
    response: { products },
  } = await listProducts({
    regionId: region.id,
    queryParams: {
      limit: 50,
      fields: "*variants.calculated_price,*categories",
    },
  })

  return (
    <div className="bg-slate-50 min-h-screen">
      <div className="bg-gradient-to-r from-slate-900 via-emerald-950 to-teal-900 text-white py-10 border-b border-emerald-800/30">
        <div className="content-container">
          <span className="text-emerald-400 text-xs font-bold uppercase tracking-widest">
            Catálogo Completo • Entrega en 30 min
          </span>
          <h1 className="text-3xl sm:text-4xl font-extrabold mt-1">
            Pasillos del Supermercado
          </h1>
          <p className="text-slate-300 text-sm mt-1 max-w-xl">
            Filtra por departamento, compara precios, revisa los detalles nutricionales en vista rápida y agrega directo a tu carrito.
          </p>
        </div>
      </div>
      <QuickSupermarketCatalog products={products || []} />
    </div>
  )
}
