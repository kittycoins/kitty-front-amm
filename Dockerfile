FROM node:16 as builder
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install 
COPY . .
RUN yarn build

FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*

COPY --from=builder /app/build .

COPY nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]