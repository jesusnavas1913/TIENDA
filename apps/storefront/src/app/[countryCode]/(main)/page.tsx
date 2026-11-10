import { Metadata } from "next"

import FeaturedProducts from "@modules/home/components/featured-products"
import Hero from "@modules/home/components/hero"
import QuickSupermarketCatalog from "@modules/home/components/quick-catalog"
import StoreLocatorColombia from "@modules/home/components/store-locator"
import { listCollections } from "@lib/data/collections"
import { listProducts } from "@lib/data/products"
import { getRegion, listRegions } from "@lib/data/regions"
import { toJsonLd } from "@lib/util/product-structured-data"
import { getSiteOrigin, listCountryCodes, STORE_NAME } from "@lib/util/site"
import { buildRegionsReturnPolicies } from "@lib/util/store-policies"

export const dynamic = "force-dynamic"
export const revalidate = 0

export async function generateMetadata(props: {
  params: Promise<{ countryCode: string }>
}): Promise<Metadata> {
  const { countryCode } = await props.params
  const [origin, regions] = await Promise.all([getSiteOrigin(), listRegions()])

  return {
    title: "Súper Express Colombia | Supermercado Online Al Detal y Al por Mayor (COP)",
    description:
      "Compra tu mercado por unidad al detal o por caja y bulto mayorista en Pesos Colombianos (COP) con entrega en 30 minutos.",
    alternates: {
      canonical: `${origin}/${countryCode}`,
      languages: {
        ...Object.fromEntries(
          listCountryCodes(regions).map((code) => [
            `en-${code.toUpperCase()}`,
            `${origin}/${code}`,
          ])
        ),
        "x-default": origin,
      },
    },
  }
}

export default async function Home(props: {
  params: Promise<{ countryCode: string }>
}) {
  const params = await props.params

  const { countryCode } = params

  const region = (await getRegion(countryCode)) || (await getRegion("co"))

  const { collections } = await listCollections({
    fields: "id, handle, title",
  }).catch(() => ({ collections: [] }))

  let allProducts: any[] = []
  if (region) {
    try {
      const { response } = await listProducts({
        regionId: region.id,
        queryParams: {
          limit: 100,
          fields: "*variants.calculated_price,*categories,+metadata",
        },
      })
      allProducts = response?.products || []
    } catch {
      allProducts = []
    }
  }

  const [origin, regions] = await Promise.all([
    getSiteOrigin(),
    listRegions(),
  ])
  const homeUrl = `${origin}/${countryCode}`
  const returnPolicies = buildRegionsReturnPolicies(regions)
  const structuredData = [
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      name: STORE_NAME,
      url: origin,
      ...(returnPolicies.length
        ? { hasMerchantReturnPolicy: returnPolicies }
        : {}),
    },
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      name: STORE_NAME,
      url: homeUrl,
      potentialAction: {
        "@type": "SearchAction",
        target: {
          "@type": "EntryPoint",
          urlTemplate: `${homeUrl}/search?q={search_term_string}`,
        },
        "query-input": "required name=search_term_string",
      },
    },
  ]

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: toJsonLd(structuredData) }}
      />
      <Hero />
      <QuickSupermarketCatalog products={allProducts || []} />
      <StoreLocatorColombia />
    </>
  )
}
