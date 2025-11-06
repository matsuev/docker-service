# STAGE 1

FROM golang:alpine3.22 AS builder

WORKDIR /app

COPY ./go .

RUN go build -o /app/goservice /app/main.go

# STAGE 2

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/goservice .

CMD ["/app/goservice"]