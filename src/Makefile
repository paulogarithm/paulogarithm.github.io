# This is the makefile to deploy the application on web

OUTPUT = portfolio
ROOT = ..
OUTPATH = $(ROOT)/$(OUTPUT)
BASE_HREF = /$(OUTPUT)/
GITHUB_USER = paulogarithm
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(GITHUB_USER).github.io
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

define say
	@$(shell which echo) -ne "→ \x1B[34;1m$(strip $1)\x1B[m\n"
endef

define finish
	@$(shell which echo) -ne "\x1B[32;1m$(strip $1)\x1B[m\n"
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
	$(call say, Creating folders...)
	-mkdir $(OUTPATH)
	$(call say, Deploying to git repository...)
	cp -r build/web/* $(OUTPATH)

re: clean all

publish: clean deploy
	$(call say, Publishing...)
	git add ..
	git commit
	$(call finish, 🚀 All done ! Finish the deploy in $(GITHUB_REPO) !)

.PHONY: deploy clean all re