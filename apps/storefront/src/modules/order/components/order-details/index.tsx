import { HttpTypes } from "@medusajs/types"
import { Text } from "@modules/common/components/ui"

type OrderDetailsProps = {
  order: HttpTypes.StoreOrder
  showStatus?: boolean
}

const OrderDetails = ({ order, showStatus }: OrderDetailsProps) => {
  const formatStatus = (str: string) => {
    const formatted = str.split("_").join(" ")

    return formatted.slice(0, 1).toUpperCase() + formatted.slice(1)
  }

  return (
    <div className="bg-emerald-50/70 border border-emerald-200 rounded-xl p-4">
      <Text>
        Hemos enviado los detalles de confirmación de tu pedido al correo{" "}
        <span
          className="text-emerald-900 font-bold"
          data-testid="order-email"
        >
          {order.email}
        </span>
        .
      </Text>
      <Text className="mt-2">
        Fecha del pedido:{" "}
        <span className="font-semibold" data-testid="order-date">
          {new Date(order.created_at).toLocaleDateString("es-CO", {
            year: "numeric",
            month: "long",
            day: "numeric",
          })}
        </span>
      </Text>
      <Text className="mt-2 text-emerald-800 font-bold">
        Número de Pedido / Remisión: #<span data-testid="order-id">{order.display_id}</span>
      </Text>

      <div className="flex items-center text-compact-small gap-x-4 mt-4">
        {showStatus && (
          <>
            <Text>
              Estado de despacho:{" "}
              <span className="text-ui-fg-subtle " data-testid="order-status">
                {formatStatus(order.fulfillment_status)}
              </span>
            </Text>
            <Text>
              Estado de pago:{" "}
              <span
                className="text-ui-fg-subtle "
                sata-testid="order-payment-status"
              >
                {formatStatus(order.payment_status)}
              </span>
            </Text>
          </>
        )}
      </div>
    </div>
  )
}

export default OrderDetails
