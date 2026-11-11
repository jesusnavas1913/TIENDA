"use client"

import Back from "@modules/common/icons/back"
import FastDelivery from "@modules/common/icons/fast-delivery"
import Refresh from "@modules/common/icons/refresh"

import Accordion from "./accordion"
import { HttpTypes } from "@medusajs/types"

type ProductTabsProps = {
  product: HttpTypes.StoreProduct
}

const ProductTabs = ({ product }: ProductTabsProps) => {
  const tabs = [
    {
      label: "Información y Frescura",
      component: <ProductInfoTab product={product} />,
    },
    {
      label: "Envío Express y Devoluciones",
      component: <ShippingInfoTab />,
    },
  ]

  return (
    <div className="w-full">
      <Accordion type="multiple">
        {tabs.map((tab, i) => (
          <Accordion.Item
            key={i}
            title={tab.label}
            headingSize="medium"
            value={tab.label}
          >
            {tab.component}
          </Accordion.Item>
        ))}
      </Accordion>
    </div>
  )
}

const ProductInfoTab = ({ product }: ProductTabsProps) => {
  const meta = (product.metadata || {}) as Record<string, any>
  return (
    <div className="text-small-regular py-8">
      <div className="grid grid-cols-2 gap-x-8">
        <div className="flex flex-col gap-y-4">
          <div>
            <span className="font-semibold">Código de Barras GS1</span>
            <p className="font-mono">
              {meta.barcode || product.variants?.[0]?.barcode || "770 Colombia"}
            </p>
          </div>
          <div>
            <span className="font-semibold">Origen / Calidad</span>
            <p>{product.origin_country || "Colombia (Súper Express)"}</p>
          </div>
          <div>
            <span className="font-semibold">Presentación Detal</span>
            <p>{meta.detal_label || "1 Unidad Estándar"}</p>
          </div>
        </div>
        <div className="flex flex-col gap-y-4">
          <div>
            <span className="font-semibold">Presentación Mayorista</span>
            <p>
              {meta.mayor_label ||
                `Caja / Paca x ${meta.mayor_units || 10} uds`}
            </p>
          </div>
          <div>
            <span className="font-semibold">Sede / Sucursal</span>
            <p>{meta.sede || "Sede Principal"}</p>
          </div>
        </div>
      </div>
    </div>
  )
}

const ShippingInfoTab = () => {
  return (
    <div className="text-small-regular py-8">
      <div className="grid grid-cols-1 gap-y-8">
        <div className="flex items-start gap-x-2">
          <FastDelivery />
          <div>
            <span className="font-semibold">Entrega Express en 30 minutos</span>
            <p className="max-w-sm">
              Recibe tu pedido fresco directamente en la puerta de tu casa con cadena de frío garantizada.
            </p>
          </div>
        </div>
        <div className="flex items-start gap-x-2">
          <Refresh />
          <div>
            <span className="font-semibold">Garantía de Frescura 100%</span>
            <p className="max-w-sm">
              ¿Algún producto no llegó en el punto que esperabas? Te lo cambiamos de inmediato sin costo adicional.
            </p>
          </div>
        </div>
        <div className="flex items-start gap-x-2">
          <Back />
          <div>
            <span className="font-semibold">Reembolso Inmediato</span>
            <p className="max-w-sm">
              Tu satisfacción es nuestra prioridad. Devoluciones fáciles en 1 clic desde tu cuenta.
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}

export default ProductTabs
