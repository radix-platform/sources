#
# Project Home:
# ============
# https://kernel.org/pub/linux/utils/util-linux/
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/utils/util-linux/
#

url         = https://kernel.org/pub/linux/utils/util-linux

versions    = 2.21.2 2.23 2.24 2.24.1 2.27 2.27.1 2.29.2 2.33.2 2.34 2.36 2.36.1 2.36.2
pkgname     = util-linux
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
