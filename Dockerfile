# Dockerfile - Fase 2 DevOps na Pratica
# Etapa 1: build da aplicacao Node.js
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY src ./src
COPY scripts ./scripts
RUN npm run build

# Etapa 2: imagem final com Nginx para servir site estatico
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q --spider http://127.0.0.1/health || exit 1
