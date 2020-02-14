FROM node:alpine AS builder
WORKDIR /src
RUN apk add python make g++
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run-script build

FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d/* && \
    rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /src/dist/ /usr/share/nginx/html/