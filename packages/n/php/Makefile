#
# Project Home:
# ============
# http://www.php.net
#
# Downloads:
# =========
# http://php.net/downloads.php
# https://www.php.net/downloads.php
#
# whet -O php-5.6.2.tar.bz2 http://ru2.php.net/get/php-5.6.2.tar.bz2/from/this/mirror
#

url         = http://ru2.php.net/get

versions    = 5.6.2 5.6.17
versions   += 7.0.2 7.3.11 7.3.27
versions   += 7.4.16
versions   += 8.0.3
pkgname     = php
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .asc, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -O $$tarball $(url)/$$tarball/from/this/mirror ; \
	done

$(signatures): %.$(suffix).asc : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -O $$signature $(url)/$$signature/from/this/mirror ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
