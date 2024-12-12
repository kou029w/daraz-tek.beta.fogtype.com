REMOTE_HOST := $(notdir $(shell pwd -L))

.PHONY: help
help:
	@cat README.md

.PHONY: install
install:
	ssh $(REMOTE_HOST) <$@

.PHONY: deploy
deploy:
	ssh $(REMOTE_HOST) <$@

.env:
	touch $@
	chmod 600 $@
	@echo POSTGRES_PASSWORD=$(shell openssl rand -hex 32) >$@
