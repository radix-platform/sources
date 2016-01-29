#
# Project Home:
# ============
# http://www.x.org/wiki
#
# Downloads:
# =========
# http://www.x.org/releases/individual/data
#

url         = http://www.x.org/releases/individual/data/xkeyboard-config

versions    = 2.6 2.7 2.8 2.9 2.10.1 2.11 2.12 2.13 2.14 2.15 2.16 2.17
pkgname     = xkeyboard-config
suffix      = tar.bz2

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
