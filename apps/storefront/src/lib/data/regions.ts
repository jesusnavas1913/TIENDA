"use server"

import { sdk } from "@lib/config"
import { HttpTypes } from "@medusajs/types"
import { getCacheOptions } from "./cookies"

export const listRegions = async () => {
  return await sdk.client
    .fetch<{ regions: HttpTypes.StoreRegion[] }>(`/store/regions`, {
      method: "GET",
      cache: "no-store",
    })
    .then(({ regions }) => regions)
    .catch(() => [])
}

export const retrieveRegion = async (id: string) => {
  return await sdk.client
    .fetch<{ region: HttpTypes.StoreRegion }>(`/store/regions/${id}`, {
      method: "GET",
      cache: "no-store",
    })
    .then(({ region }) => region)
}

const regionMap = new Map<string, HttpTypes.StoreRegion>()

export const getRegion = async (countryCode: string) => {
  try {
    const regions = await listRegions()

    if (!regions || regions.length === 0) {
      return regionMap.get(countryCode) || regionMap.get("co") || null
    }

    regions.forEach((region) => {
      region.countries?.forEach((c) => {
        if (c?.iso_2) {
          regionMap.set(c.iso_2.toLowerCase(), region)
        }
      })
    })

    const code = (countryCode || "co").toLowerCase()
    const colRegion =
      regionMap.get("co") ||
      regions.find((r) => r.currency_code?.toLowerCase() === "cop") ||
      regions[0]

    return regionMap.get(code) || colRegion || null
  } catch {
    return regionMap.get("co") || null
  }
}
