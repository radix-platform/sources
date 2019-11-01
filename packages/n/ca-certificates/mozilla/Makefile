#
# Project Home:
# ============
# Repo: https://hg.mozilla.org/mozilla-central/file
# Path: https://hg.mozilla.org/mozilla-central/file/tip/security/nss/lib/ckfw/builtins
#
# Downloads:
# =========
# https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins/certdata.txt
# https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins/nssckbi.h
#

url         = https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins

version     = $(shell echo `date +%Y%m%d`)
pkgname     = mozilla-certs
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@wget -N $(url)/certdata.txt
	@wget -N $(url)/nssckbi.h
	@tar cJvf $(tarball) certdata.txt nssckbi.h
	@rm -f certdata.txt nssckbi.h

$(sha1s): $(tarball)
	@echo -e "\n======= Calculation the '$(tarball)' sha1sum =======\n"
	@sha1sum --binary $(tarball) > $(tarball).sha1sum ; \

downloads_clean:
	@rm -rf $(pkgname)-*$(suffix) $(pkgname)-*$(suffix).sha1sum
