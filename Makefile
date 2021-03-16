.PHONY: build run push

tag := $(shell git rev-parse --short HEAD)
repo := darkhelmetlive/serve

serve: *.go
	go build -x serve.go logger.go

build:
	docker build -t $(repo):$(tag) .

run:
	docker run --rm -it $(repo):$(tag)

push:
	docker push $(repo):$(tag)
