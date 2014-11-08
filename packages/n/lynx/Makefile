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
#

url         = http://lynx.isc.org

versions    = 2.8.6 2.8.7
pkgname     = lynx
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/lynx$$version/lynx$$version.$(suffix) ; \
	  tar xjf lynx$$version.$(suffix) ; \
	  ver=`echo $$version | sed 's/\./\-/g'` ; \
	  mv lynx$$ver lynx-$$version ; \
	  tar cjf $$tarball lynx-$$version ; \
	  rm -rf lynx-$$version lynx$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
