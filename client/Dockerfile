FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install -g serve
COPY . .
RUN serve --single build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html