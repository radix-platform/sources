#
# Project Home:
# ============
# http://lynx.isc.org
# http://lynx.isc.org/lynx2.8.7/index.html
#
# Downloads:
# =========
# http://lynx.isc.org
#  ftp://lynx.isc.org
# ftp://invisible-island.net/lynx/tarballs
#

url         = ftp://invisible-island.net/lynx/tarballs
url         = https://invisible-mirror.net/archives/lynx/tarballs

versions    = 2.8.9.1
pkgname     = lynx
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]\.[0-9]*\.[0-9]*\)\.\([0-9]*\)\(\..*\)/\2/'` ; \
	  release=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]\.[0-9]*\.[0-9]*\)\.\([0-9]*\)\(\..*\)/\3/'` ; \
	  wget -N $(url)/lynx$${version}rel.$$release.$(suffix) ; \
	  tar xjf lynx$${version}rel.$$release.$(suffix) ; \
	  mv lynx$${version}rel.$$release lynx-$$version.$$release ; \
	  tar cjf $$tarball lynx-$$version.$$release ; \
	  rm -rf lynx-$$version.$$release lynx$${version}rel.$$release.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
