#
# Project Home:
# ============
# http://wiki.freeradius.org/Home
# http://wiki.freeradius.org/project/Radiusclient
#
# Downloads:
# =========
# ftp://ftp.freeradius.org/pub/freeradius
# ftp://ftp.ntua.gr/pub/net/radius/freeradius
#

url         = ftp://ftp.ntua.gr/pub/net/radius/freeradius

versions    = 2.2.10
versions   += 3.0.19
pkgname     = freeradius-server
suffix      = tar.gz
sign_suffix = sig

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
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
