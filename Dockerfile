FROM node:20.16.0-alpine

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN pnpm install --prod --no-frozen-lockfile

COPY . .

EXPOSE 3000

CMD ["node", "dist/server/index.js"]ENV NODE_ENV="production"
ENV ADDON_DIR="/addon"
EXPOSE 3000 3443

CMD ["node", "dist/server/index.js"]
