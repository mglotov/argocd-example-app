FROM public.ecr.aws/docker/library/golang:1.17.6-alpine3.15 AS build

WORKDIR /go/src/app
COPY main.go main.go
RUN go build -o /go/bin/app main.go

FROM alpine:3.10

WORKDIR /usr/bin
COPY --from=build /go/bin .
EXPOSE 8090

CMD ["app"]
