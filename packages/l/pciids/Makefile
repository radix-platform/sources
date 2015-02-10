#
# Project Home:
# ============
# https://pci-ids.ucw.cz/v2.2
#
# Downloads:
# =========
# https://pci-ids.ucw.cz/pci.ids
#

url         = https://pci-ids.ucw.cz

version     = $(shell echo `date +%Y%m%d`)
pkgname     = pciids
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@wget -N $(url)/pci.ids
	@tar cJvf $(tarball) pci.ids
	@rm -f pci.ids

$(sha1s): $(tarball)
	@echo -e "\n======= Calculation the '$(tarball)' sha1sum =======\n"
	@sha1sum --binary $(tarball) > $(tarball).sha1sum ; \

downloads_clean:
	@rm -rf $(pkgname)-*$(suffix) $(pkgname)-*$(suffix).sha1sum
