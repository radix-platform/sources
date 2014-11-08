#
# Project Home:
# ============
# ... this is a very old product ...
#
# Info:
# ====
# http://wireless.kernel.org/en/users/Drivers/iwlwifi#Firmware
#
# Downloads:
# =========
# http://firmware.openbsd.org/firmware-dist
#

url         = http://firmware.openbsd.org/firmware-dist

versions    = 1.3
pkgname     = ipw2100-fw
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tgz ; \
	  mkdir -p $(pkgname)-$$version ; \
	  tar xzf $(pkgname)-$$version.tgz -C $(pkgname)-$$version ; \
	  tar cJf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
