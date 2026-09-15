FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Ghi đè REACT_APP_API_URL trống để api.ts sử dụng baseURL = '/api', khi đó Nginx proxy sẽ xử lý
RUN echo "REACT_APP_API_URL=" > .env.production
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
