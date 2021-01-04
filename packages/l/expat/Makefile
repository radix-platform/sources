#
# Project Home:
# ============
# https://libexpat.github.io
#
# GitHub:
# ======
# https://github.com/libexpat/libexpat.git
#
# Downloads:
# =========
# https://github.com/libexpat/libexpat/releases/download/R_2_2_10/expat-2.2.10.tar.xz
#

url         = https://github.com/libexpat/libexpat/releases/download

versions    = 2.2.9 2.2.10
pkgname     = expat
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=R_`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9][.0-9]*\)\(\..*\)/\2/' | sed 's,\.,_,g'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
