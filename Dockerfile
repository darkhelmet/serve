FROM golang:1.16-alpine as builder
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates
WORKDIR /build
COPY . /build
RUN go build -x -o serve *.go

FROM alpine
LABEL maintainer="daniel@huckstep.ca"

COPY --from=builder /build/serve /bin/serve

RUN mkdir /html
WORKDIR /html

ENTRYPOINT ["serve"]
