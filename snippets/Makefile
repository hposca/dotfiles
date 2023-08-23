SHELL:=/bin/bash
# Displays the help with `make`
.DEFAULT_GOAL := help

EXECUTABLES = ls dd

make_variable = "A variable defined in the Makefile"

##@ Application

build: check-dependencies ## Builds the application
	@echo "Building the application..."

run: ## Runs the application
	@echo "Running the application..."

all: install-deps build run ## Run all steps required to start the application

##@ Tests

tests: ## Run tests to validate that the application is running as expected
	@echo "Testing the application..."

# https://makefiletutorial.com/#double-dollar-sign
# https://stackoverflow.com/a/29085760
scope: ## Demonstrate variable scoping
	@sh_var="A shell variable"; \
		echo "This is $${sh_var}."
	@echo "This is ${make_variable}."
	@set -e ;\
	TMP=$$(mktemp) ;\
	echo "Variable from a shell command output: $${TMP}"

##@ Dependencies

# https://stackoverflow.com/a/25668869
.PHONY: check-dependencies
check-dependencies: ## Verifies if all the required dependencies are installed
	@echo $(foreach exec,$(EXECUTABLES),\
		$(if $(shell which $(exec)),"",$(error "No $(exec) in PATH. Please run 'make install-deps'.")))

install-deps: ## Installs the required dependencies
	@echo "Installing dependencies..."

clean: ## Cleans all
	@echo "Cleaning..."

##@ Help

# From: https://www.padok.fr/en/blog/beautiful-makefile-awk
.PHONY: help
help: ## Displays this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-17s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
