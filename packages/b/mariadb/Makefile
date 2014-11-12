#
# Project Home:
# ============
# https://mariadb.org
#
# Downloads:
# =========
# https://downloads.mariadb.org/mariadb
# https://downloads.mariadb.org/interstitial/mariadb-${VERSION}/source
#
# Mirrors:
# =======
# http://mirror.mephi.ru/mariadb/mariadb-${VERSION}/source
#

url         = https://downloads.mariadb.org/interstitial

versions    = 5.5.40 10.0.14
pkgname     = mariadb
suffix      = tar.gz
sign_suffix = asc

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$(pkgname)-$$version/source/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  version=`echo $$signature | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$(pkgname)-$$version/source/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
