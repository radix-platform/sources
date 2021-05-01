#
# Project Home:
# ============
# https://www.libpng.org
# https://www.libpng.org/pub/png/libpng.html
# https://libpng.sourceforge.net/index.html
#
# Downloads:
# =========
# https://sourceforge.net/projects/libpng/files/libpng12
#

url         = https://downloads.sourceforge.net/project/libpng

versions    = 1.2.59
pkgname     = libpng
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[\.][0-9]*[\.][0-9]*\)\(\..*\)/\2/'` ; \
	    major=`echo $$version | sed 's/\([0-9]*[\.][0-9]*\)\([\.][0-9]*\)/\1/' | sed 's/\.//g'` ; \
	  wget -N $(url)/$(pkgname)$$major/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
