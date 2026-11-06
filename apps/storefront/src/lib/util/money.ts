import { isEmpty } from "./isEmpty"

type ConvertToLocaleParams = {
  amount: number
  currency_code: string
  minimumFractionDigits?: number
  maximumFractionDigits?: number
  locale?: string
}

export const convertToLocale = ({
  amount,
  currency_code,
  minimumFractionDigits,
  maximumFractionDigits,
  locale = "es-CO",
}: ConvertToLocaleParams) => {
  const isCOP = currency_code?.toLowerCase() === "cop"
  return currency_code && !isEmpty(currency_code)
    ? new Intl.NumberFormat(isCOP ? "es-CO" : locale, {
        style: "currency",
        currency: currency_code,
        minimumFractionDigits: minimumFractionDigits ?? (isCOP ? 0 : 2),
        maximumFractionDigits: maximumFractionDigits ?? (isCOP ? 0 : 2),
      }).format(amount)
    : amount.toString()
}
