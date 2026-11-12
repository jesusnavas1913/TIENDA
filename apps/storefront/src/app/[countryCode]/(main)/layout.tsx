import { Metadata } from "next"

import { listCartOptions, retrieveCart } from "@lib/data/cart"
import { retrieveCustomer } from "@lib/data/customer"
import { getBaseURL } from "@lib/util/env"
import { StoreCartShippingOption } from "@medusajs/types"
import CartMismatchBanner from "@modules/layout/components/cart-mismatch-banner"
import Footer from "@modules/layout/templates/footer"
import Nav from "@modules/layout/templates/nav"
import FreeShippingPriceNudge from "@modules/shipping/components/free-shipping-price-nudge"

export const metadata: Metadata = {
  metadataBase: new URL(getBaseURL()),
}

export default async function PageLayout(props: { children: React.ReactNode }) {
  const customer = await retrieveCustomer()
  const cart = await retrieveCart()
  let shippingOptions: StoreCartShippingOption[] = []

  if (cart) {
    const { shipping_options } = await listCartOptions()

    shippingOptions = shipping_options
  }

  return (
    <>
      <Nav />
      {customer && cart && (
        <CartMismatchBanner customer={customer} cart={cart} />
      )}

      {cart && (
        <FreeShippingPriceNudge
          variant="popup"
          cart={cart}
          shippingOptions={shippingOptions}
        />
      )}
      {props.children}
      <a
        href="https://wa.me/573001234567?text=Hola%20S%C3%BAper%20Express%20Colombia%2C%20quiero%20hacer%20un%20pedido%20al%20detal%20o%20por%20mayor"
        target="_blank"
        rel="noopener noreferrer"
        className="fixed bottom-5 right-5 z-40 bg-[#25D366] hover:bg-[#1ebe5d] text-slate-950 font-extrabold text-xs sm:text-sm px-4 py-3 rounded-full shadow-2xl border-2 border-white flex items-center gap-2 transition-transform hover:scale-105"
        title="Atención y Pedidos por WhatsApp Colombia"
      >
        <span className="text-lg">💬</span>
        <span className="hidden sm:inline">Pedidos WhatsApp (Mayor y Detal)</span>
      </a>
      <Footer />
    </>
  )
}
