.PHONY: test

define MODFILE
module github.com/wiselike/revel-log15

go 1.17

require (
	github.com/mattn/go-colorable v0.1.14
	golang.org/x/sys v0.29.0
	golang.org/x/term v0.28.0
	gopkg.in/stack.v0 v0.0.0-20141108040640-9b43fcefddd0
)
endef
export MODFILE

test:
	@if [ ! -f go.mod ]; then \
		echo "$$MODFILE" > go.mod; \
	fi
	@go mod tidy
	go test ./...
	@\rm go.mod go.sum