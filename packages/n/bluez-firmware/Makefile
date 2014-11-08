#
# Project Home:
# ============
# http://www.bluez.org
#
# NOTE:
#   moved to deprecated category.
#   This package needed for Broadcom BCM203x and STLC2300 Bluetooth chips.
#
# Downloads:
# =========
# http://www.bluez.org/download
#

url         = http://bluez.sf.net/download

versions    = 1.2
pkgname     = bluez-firmware
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
