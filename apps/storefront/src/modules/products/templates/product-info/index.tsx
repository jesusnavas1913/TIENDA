import { HttpTypes } from "@medusajs/types"
import { Heading, Text } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"

type ProductInfoProps = {
  product: HttpTypes.StoreProduct
}

const ProductInfo = ({ product }: ProductInfoProps) => {
  const meta = (product.metadata || {}) as Record<string, any>
  const barcode =
    meta.barcode || product.variants?.[0]?.barcode || "7701001001"
  const sede = meta.sede || "Todas las Sedes"
  const stockQty = meta.stock_qty ?? 150

  return (
    <div id="product-info">
      <div className="flex flex-col gap-y-4 lg:max-w-[500px] mx-auto">
        <div className="flex flex-wrap items-center gap-2">
          <span className="text-xs font-mono font-bold bg-slate-100 text-slate-800 px-2.5 py-1 rounded-md border border-slate-200">
            ║▌║ GS1: {barcode}
          </span>
          <span className="text-xs font-bold bg-emerald-50 text-emerald-800 px-2.5 py-1 rounded-md border border-emerald-200">
            📍 {sede} ({stockQty} uds)
          </span>
        </div>

        {product.collection && (
          <LocalizedClientLink
            href={`/collections/${product.collection.handle}`}
            className="text-medium text-ui-fg-muted hover:text-ui-fg-subtle"
          >
            {product.collection.title}
          </LocalizedClientLink>
        )}
        <Heading
          level="h1"
          className="text-3xl leading-10 text-ui-fg-base font-extrabold"
          data-testid="product-title"
        >
          {product.title}
        </Heading>

        <Text
          className="text-medium text-ui-fg-subtle whitespace-pre-line"
          data-testid="product-description"
        >
          {product.description}
        </Text>
      </div>
    </div>
  )
}

export default ProductInfo
