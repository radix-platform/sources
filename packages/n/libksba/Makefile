#
# Project Home:
# ============
# http://gnupg.org
#
# Downloads:
# =========
# ftp://ftp.gnupg.org/gcrypt/libksba
# https://gnupg.org/ftp/gcrypt/libksba
#

url         = https://gnupg.org/ftp/gcrypt/libksba

versions    = 1.2.0 1.3.0 1.3.1 1.3.3 1.3.5 1.4.0 1.5.0
pkgname     = libksba
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .sig, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).sig : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
