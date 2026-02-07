FROM node:14-alpine

RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN NODE_OPTIONS="--max-old-space-size=2048" npm run build

EXPOSE 1337

CMD ["npm", "start"]
