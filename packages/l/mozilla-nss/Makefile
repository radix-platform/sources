#
# Project Home:
# ============
# https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS
#
# Downloads:
# =========
# ftp://ftp.mozilla.org/pub/security/nss/releases/NSS_${VERSION//./_}_RTM/src/nss-${VERSION}.tar.gz
#

url         = http://ftp.mozilla.org/pub/security/nss/releases

versions    = 3.17.3 3.17.4 3.19.4 3.20.2 3.21
pkgname     = nss
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix),$(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/NSS_$${version//./_}_RTM/src/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
