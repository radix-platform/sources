#
# Project Home:
# ============
# https://www.cups.org
#
# Downloads:
# =========
# https://www.cups.org/software.php
#

url         = https://www.cups.org/software

versions    = 1.5.4 2.0.0 2.0.1 2.1.2
pkgname     = cups
suffix      = tar.bz2
sign_suffix = sig

tarballs    = $(addsuffix -source.$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\([.-].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  version=`echo $$signature | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\([.-].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
