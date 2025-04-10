# Étape 1 : build Angular app
FROM node:20 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build --configuration production

# Étape 2 : servir avec NGINX
FROM nginx:alpine
COPY --from=builder /app/dist/todo-app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
