#
# Project Home:
# ============
# http://www.libpng.org
# http://www.libpng.org/pub/png/libpng.html
# http://libpng.sourceforge.net/index.html
#
# Downloads:
# =========
# http://sourceforge.net/projects/libpng/files/libpng15
#

url         = http://downloads.sourceforge.net/libpng/files

versions    = 1.5.18
pkgname     = libpng
suffix      = tar.gz

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
