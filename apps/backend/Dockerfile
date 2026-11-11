FROM node:22-alpine AS base
WORKDIR /app

RUN apk add --no-cache libc6-compat
COPY package*.json ./
RUN npm ci --omit=dev || npm install --production

COPY . .
RUN npm run build

EXPOSE 9000
ENV NODE_ENV=production
ENV PORT=9000

CMD ["npm", "run", "start"]
