#
# Project Home:
# ============
# http://gnupg.org
#
# Downloads:
# =========
# ftp://ftp.gnupg.org/gcrypt/libgcrypt
# https://gnupg.org/ftp/gcrypt/libgcrypt
#

url         = https://gnupg.org/ftp/gcrypt/libgcrypt

versions    = 1.5.3 1.6.1 1.6.2 1.6.4 1.7.0 1.8.5 1.9.2
pkgname     = libgcrypt
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
