all: build-4.2 build-4.2-onbuild build-4.2.0 build-4.2.0-onbuild

build-4.2:
	docker build -t index.xxxxx.com/node:4.2 4.2
	docker build -t index.xxxxx.com/node:4 4.2

build-4.2-onbuild:
	docker build -t index.xxxxx.com/node:4.2-onbuild 4.2/onbuild
	docker build -t index.xxxxx.com/node:4-onbuild 4.2/onbuild

build-4.2.0:
	docker build -t index.xxxxx.com/node:4.2.0 4.2.0
	docker build -t index.xxxxx.com/node:4.0 4.2.0

build-4.2.0-onbuild:
	docker build -t index.xxxxx.com/node:4.2.0-onbuild 4.2.0/onbuild
	docker build -t index.xxxxx.com/node:4.0-onbuild 4.2.0/onbuild


