#
# Project Home:
# ============
# http://gnupg.org
#
# Downloads:
# =========
# ftp://ftp.gnupg.org/gcrypt/gnutls
# https://gnupg.org/ftp/gcrypt/gnutls
#

url         = https://gnupg.org/ftp/gcrypt/gnutls

versions    = 3.1.16 3.1.22 3.4.8 3.6.10
pkgname     = gnutls
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .sig, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  major_minor=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$major_minor/$$tarball ; \
	done

$(signatures): %.$(suffix).sig : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  major_minor=`echo $$signature | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$major_minor/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
