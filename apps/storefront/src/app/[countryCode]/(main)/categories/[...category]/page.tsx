import { Metadata } from "next"
import { notFound } from "next/navigation"

import { getCategoryByHandle } from "@lib/data/categories"
import { listProducts } from "@lib/data/products"
import { getRegion } from "@lib/data/regions"
import QuickSupermarketCatalog from "@modules/home/components/quick-catalog"

export const dynamic = "force-dynamic"

type Props = {
  params: Promise<{ category: string[]; countryCode: string }>
}

export async function generateMetadata(props: Props): Promise<Metadata> {
  const params = await props.params
  try {
    const productCategory = await getCategoryByHandle(params.category)
    const title = (productCategory?.name || "Pasillo") + " | Súper Express Colombia"
    return {
      title,
      description:
        productCategory?.description ??
        `Compra ${productCategory?.name || "productos"} al detal y al por mayor en Pesos Colombianos (COP).`,
    }
  } catch {
    return { title: "Pasillo | Súper Express Colombia" }
  }
}

export default async function CategoryPage(props: Props) {
  const params = await props.params
  const productCategory = await getCategoryByHandle(params.category)

  if (!productCategory) {
    notFound()
  }

  const region =
    (await getRegion(params.countryCode)) || (await getRegion("co"))

  const {
    response: { products },
  } = region
    ? await listProducts({
        regionId: region.id,
        queryParams: {
          limit: 100,
          fields: "*variants.calculated_price,*categories,+metadata",
        },
      })
    : { response: { products: [] } }

  return (
    <div className="bg-slate-50 min-h-screen">
      <div className="bg-gradient-to-r from-slate-900 via-emerald-950 to-teal-900 text-white py-10 border-b border-emerald-800/30">
        <div className="content-container">
          <span className="text-emerald-400 text-xs font-bold uppercase tracking-widest">
            Pasillo del Supermercado • Precios Al Detal y Al por Mayor (COP)
          </span>
          <h1
            className="text-3xl sm:text-4xl font-extrabold mt-1"
            data-testid="category-page-title"
          >
            {productCategory.name}
          </h1>
          <p className="text-slate-300 text-sm mt-1 max-w-xl">
            {productCategory.description ||
              "Compara precios por unidad o por caja mayorista, revisa el PUM y agrega directo a tu carrito."}
          </p>
        </div>
      </div>
      <QuickSupermarketCatalog
        products={products || []}
        initialCategory={productCategory.name}
      />
    </div>
  )
}
