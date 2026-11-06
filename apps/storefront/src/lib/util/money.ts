import { isEmpty } from "./isEmpty"

type ConvertToLocaleParams = {
  amount: number
  currency_code: string
  minimumFractionDigits?: number
  maximumFractionDigits?: number
  locale?: string
}

export const formatCOP = (amount: number): string => {
  const rounded = Math.round(amount || 0)
  return `$ ${rounded.toLocaleString("es-CO")} COP`
}

export const convertToLocale = ({
  amount,
  currency_code,
  minimumFractionDigits,
  maximumFractionDigits,
  locale = "es-CO",
}: ConvertToLocaleParams) => {
  if (!currency_code || isEmpty(currency_code)) {
    return formatCOP(amount)
  }

  const isCOP = currency_code.toLowerCase() === "cop"
  if (isCOP) {
    return formatCOP(amount)
  }

  return new Intl.NumberFormat(locale, {
    style: "currency",
    currency: currency_code,
    minimumFractionDigits: minimumFractionDigits ?? 0,
    maximumFractionDigits: maximumFractionDigits ?? 0,
  }).format(amount)
}
