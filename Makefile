MAKEFLAGS += --silent

NAME = $(shell cat NAME)
VERSION = $(shell cat VERSION)
URL = https://github.com/radxa-pkg/radxa-usbnet
DESCRIPTION = Enable USB ethernet gadget on selected Radxa single board computers

all:
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) \
		-a all \
		--deb-priority optional --category utils \
		--deb-field "Multi-Arch: foreign" \
		--deb-field "Replaces: $(NAME)" \
		--deb-field "Conflicts: $(NAME)" \
		--deb-field "Provides: $(NAME)" \
		--url $(URL) \
		--description "$(DESCRIPTION)" \
		--license "GPL-2+" \
		-m "Radxa <dev@radxa.com>" \
		--vendor "Radxa" \
		--force \
		./root/=/