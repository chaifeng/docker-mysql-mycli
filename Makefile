all: test

.PHONY: build
build:
	docker build -t chaifeng/mycli ./

.PHONY: test
test: build
	docker run -t chaifeng/mycli
