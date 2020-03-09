export RICHGO_FORCE_COLOR = 1
export GOPATH ?= $(HOME)/go
export GOBIN ?= $(GOPATH)/bin
export PATH := $(PATH):$(GOBIN)
export GOCACHE ?= $(GOPATH)/cache

RICHGO := $(GOBIN)/richgo
LINTER := $(GOBIN)/golangci-lint

all: lint unit dab logs

lint:
	echo linting
	golangci-lint run ./...

unit:
	echo unit tests
	richgo test -cover -v gerrit.lan/migrator/internal/...

build:
	echo build
	go build ./...
	
run: 
	echo run

cover:
	go test -coverprofile xcover ./... 
	go tool cover -html=xcover
