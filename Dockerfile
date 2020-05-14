FROM golang:1.13-alpine3.10 AS build

WORKDIR /go/src/app
COPY main.go main.go
RUN go build -o /go/bin/app main.go

FROM alpine:3.10

WORKDIR /usr/bin
COPY --from=build /go/bin .
EXPOSE 8090

CMD ["app"]