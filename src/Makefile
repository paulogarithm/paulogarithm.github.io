# Makefile for deploying the Flutter web projects to GitHub

OUTPUT = portfolio
ROOT = ..
OUTPATH = $(ROOT)/$(OUTPUT)
BASE_HREF = /$(OUTPUT)/
# Replace this with your GitHub username
GITHUB_USER = paulogarithm
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(GITHUB_USER).github.io
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

define say
	@$(shell which echo) -ne "→ \x1B[34;1m$(strip $1)\x1B[m\n"
endef

ifndef OUTPUT
	$(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif

all:
	$(call say, Getting packages...)
	flutter pub get
	$(call say, Building for web...)
	flutter build web --release --base-href $(BASE_HREF)

clean:
	$(call say, Clean existing repository)
	flutter clean

deploy: all
	# $(call say, Generating the web folder...)
	# flutter create . --platform web
	$(call say, Creating folders...)
	-mkdir $(OUTPATH)
	$(call say, Deploying to git repository...)
	cp -r build/web/* $(OUTPATH)
	
	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

re: clean all

publish:
	$(call say, Publishing...)
	git add ..
	git commit
	git push

.PHONY: deploy clean all re