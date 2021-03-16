FROM golang:1.16-alpine as builder
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates
RUN go get github.com/darkhelmet/serve

FROM alpine
LABEL maintainer="daniel@huckstep.ca"

ADD serve /bin/

RUN mkdir /html
WORKDIR /html

ENTRYPOINT ["serve"]
