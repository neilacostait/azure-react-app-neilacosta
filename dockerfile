#deploy react app
FROM --platform=linux/amd64 node:20.13.1 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

#deploy using nginx, specify use of linux64 amd64 due that i have macbook m1max arm architecture
FROM --platform=linux/amd64 nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]