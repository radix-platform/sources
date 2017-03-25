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

versions    = 5.5.47 5.5.49
versions   += 10.0.25 10.0.30
versions   += 10.1.11 10.1.14
pkgname     = mariadb
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$(pkgname)-$$version/source/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
