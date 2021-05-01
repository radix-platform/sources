#
# Project Home:
# ============
# https://launchpad.net/intltool
#
# Downloads:
# =========
# https://launchpad.net/intltool/trunk/${VERSION}/+download/intltool-${VERSION}.tar.gz
#

url         = https://launchpad.net/intltool/trunk

versions    = 0.51.0
pkgname     = intltool
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9]*[.][0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/$$version/+download/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
