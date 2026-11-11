import { loadEnv, defineConfig } from '@medusajs/framework/utils'

loadEnv(process.env.NODE_ENV || 'development', process.cwd())

const isProductionOrSupabase =
  process.env.NODE_ENV === 'production' ||
  (process.env.DATABASE_URL &&
    (process.env.DATABASE_URL.includes('supabase') ||
      process.env.DATABASE_URL.includes('sslmode=require') ||
      process.env.DATABASE_URL.includes('pooler.supabase.com')))

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL,
    databaseDriverOptions: isProductionOrSupabase
      ? {
          connection: {
            ssl: { rejectUnauthorized: false },
          },
        }
      : {},
    http: {
      storeCors: process.env.STORE_CORS || 'http://localhost:8000',
      adminCors: process.env.ADMIN_CORS || 'http://localhost:9000,http://localhost:5173',
      authCors: process.env.AUTH_CORS || 'http://localhost:8000,http://localhost:9000,http://localhost:5173',
      jwtSecret: process.env.JWT_SECRET || 'supersecret',
      cookieSecret: process.env.COOKIE_SECRET || 'supersecret',
    },
  },
})
