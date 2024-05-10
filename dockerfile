#deploy react app
#use this line if you have an a mac m arm/wants to deploy the container x64:
#FROM --platform=linux/amd64 node:20.13.1 AS build
FROM node:20.13.1 AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

#use this line if you have an a mac m arm/wants to deploy the container x64:
#FROM --platform=linux/amd64 nginx:alpine
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]