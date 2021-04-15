
PROJECT := $(notdir $(CURDIR))
NODE_VERSION ?= fermium

# Build commands
DOCKER := docker run --rm -w=/$(PROJECT) -v $(CURDIR):/$(PROJECT):rw

# Files that when changed should trigger a rebuild.
TS := $(shell find ./src -type f -name *.ts)

# Targets that don't result in output of the same name.
.PHONY: clean \
        distclean \
        lint \
        format \
        test \
				docs \
        debug \
        release \
				version \
				publish

# When no target is specified, the default target to run.
.DEFAULT_GOAL := debug

# Target that cleans build output and local dependencies.
distclean: clean
	@rm -rf node_modules

# Target that cleans build output
clean:
	@rm -rf out

# Target to install Node.js dependencies.
node_modules: package.json package-lock.json
	@echo "Installing dependencies..."
	@$(DOCKER) node:$(NODE_VERSION) npm install
	@touch node_modules

# Target to create the output directories.
out/debug out/release out/docs:
	@echo "Creating $@..."
	@mkdir -p $(CURDIR)/$@

# Target that compiles TypeScript to JavaScript.
out/debug/index.js: node_modules out/debug tsconfig.json $(TS)
	@echo "Creating $@..."
	@$(DOCKER) node:$(NODE_VERSION) npx tsc

# Target that bundles and treeshakes the JavaScript.
out/release/index.js: out/release out/debug/index.js
	@echo "Creating $@..."
	@$(DOCKER) node:$(NODE_VERSION) npx rollup ./out/debug/index.js --file $@

# Target that minifies the JavaScript.
out/release/index.min.js: out/release out/release/index.js
	@echo "Creating $@..."
	@$(DOCKER) node:$(NODE_VERSION) npx terser -c -m -o $@ ./out/release/index.js

# Target that bundles the TypeScript definitions.
out/release/index.d.ts: out/release out/debug/index.js
	@echo "Creating $@..."
	@$(DOCKER) node:$(NODE_VERSION) npx rollup --config

# Target that builds the documentation
out/docs/index.html: $(TS)
	@echo "Creating $@..."
	@$(DOCKER) node:$(NODE_VERSION) npx typedoc --out ./out/docs/ --exclude **/*.test.ts --exclude **/*.spec.ts ./src/

# Target that checks the code for style/formating issues.
format: node_modules
	@echo "Running style checks..."
	@$(DOCKER) node:$(NODE_VERSION) npx prettier --check .

# Target that lints the code for errors.
lint: node_modules
	@echo "Running linter..."
	@$(DOCKER) node:$(NODE_VERSION) npx eslint ./src --ext .js,.ts

# Target to run all unit tests.
test: node_modules
	@echo "Running unit tests..."
	@$(DOCKER) node:$(NODE_VERSION) npx jest

# Target that generates the API documentation.
docs: out/docs/index.html

# Target that builds a debug/development version of the app
debug: out/debug out/debug/index.js 

# Target that builds a release version of the app
release: out/release out/release/index.js out/release/index.min.js out/release/index.d.ts

# Target to bump and tag the packages version number
version: node_modules
	@echo "Bumping package version..."
	@$(DOCKER) node:$(NODE_VERSION) npx standard-version

# Target to publish the package to npm
publish: node_modules
	@echo "Bumping package version..."
	@$(DOCKER) -e NODE_AUTH_TOKEN node:$(NODE_VERSION) npm publish