#
# Project Home:
# ============
# http://elvis.the-little-red-haired-girl.org
#
# Downloads:
# =========
# http://elvis.the-little-red-haired-girl.org/gettingelvis/index.html
# ftp://ftp.cs.pdx.edu/pub/elvis
#
# Mirror:
# ======
# http://www.the-little-red-haired-girl.org/pub/elvis
#

url         = ftp://ftp.cs.pdx.edu/pub/elvis

versions    = 2.2_0
pkgname     = elvis
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
