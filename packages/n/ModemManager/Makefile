#
# Project Home:
# ============
# https://www.freedesktop.org/wiki/Software/ModemManager
#
# Downloads:
# =========
# https://www.freedesktop.org/software/ModemManager
#

url         = https://www.freedesktop.org/software/ModemManager

versions    = 1.0.0 1.4.4 1.4.12 1.10.8 1.16.2 1.16.4
pkgname     = ModemManager
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
