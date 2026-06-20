.PHONY: build install hotbuild

build:
	npx @vscode/vsce package --out out/

install:
	code --install-extension $$(ls -t out/*.vsix | head -1) --force

hotbuild: build install
