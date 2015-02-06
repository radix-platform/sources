#
# Project Home:
# ============
# https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR
#
# Downloads:
# =========
# ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${VERSION}/src/nspr-${VERSION}.tar.gz
#

url         = ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases

versions    = 4.10.7 4.10.8
pkgname     = nspr
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix),$(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$version/src/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
