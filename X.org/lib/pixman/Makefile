#
# Project Home:
# ============
# http://www.x.org/wiki
#
# Downloads:
# =========
# http://www.x.org/releases/individual/lib
#

url         = http://www.x.org/releases/individual/lib

versions    = 0.30.2 0.32.0 0.32.2 0.32.4 0.32.6 0.32.8 0.33.2 0.33.4 0.33.6 0.34.0
pkgname     = pixman
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
