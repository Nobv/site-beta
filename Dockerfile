FROM golang:1.11.1-alpine AS builder
RUN apk add --update --no-cache git && \
    go get -v github.com/gohugoio/hugo && \
    apk del --purge git
COPY . /app
WORKDIR /app
RUN hugo

#FROM nginx:alpine AS nginx
#COPY --from=builder /app/public /usr/share/nginx/html
FROM lkwg82/h2o-http2-server
#CMD ["mv", "/etc/h2o/h2o.conf", "/etc/h2o/h2o.conf.bk"]
#COPY ./h2o.conf /etc/h2o/
COPY --from=builder /app/public /var/www/html
