#
# Project Home:
# ============
# http://wiki.freeradius.org/Home
#
# Downloads:
# =========
# ftp://ftp.freeradius.org/pub/freeradius
# ftp://ftp.ntua.gr/pub/net/radius/freeradius
#

url         = ftp://ftp.ntua.gr/pub/net/radius/freeradius

versions    = 1.1.8
pkgname     = freeradius
suffix      = tar.gz
sign_suffix = sig

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

newest      = 1.1.8

all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*\)\(\.[a-z]*.*\)/\2/'` ; \
	  if [ "$(newest)" == "`echo -e "$$version\n$(newest)" | sort -V | head -n1`" ] ; then \
	    wget -N $(url)/$$tarball ; \
	  else \
	    wget -N $(url)/old/$$tarball ; \
	  fi ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  version=`echo $$signature | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*\)\(\.[a-z]*.*\)/\2/'` ; \
	  if [ "$(newest)" == "`echo -e "$$version\n$(newest)" | sort -V | head -n1`" ] ; then \
	    wget -N $(url)/$$signature ; \
	    touch $$signature ; \
	  else \
	    wget -N $(url)/old/$$signature ; \
	    touch $$signature ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
