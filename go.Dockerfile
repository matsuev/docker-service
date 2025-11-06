# STAGE 1

FROM golang:alpine3.22 AS builder

WORKDIR /app

RUN apk add git

RUN git clone https://github.com/matsuev/docker-service

RUN go build -o /app/goservice /app/docker-service/go/main.go

# STAGE 2

FROM alpine:3.22

ENV DB_HOST="localhost"
ENV DB_PORT="5432"
ENV DB_USER="pgsuser"
ENV DB_PASS="pgpass"

WORKDIR /app

COPY --from=builder /app/goservice .

CMD ["/app/goservice"]