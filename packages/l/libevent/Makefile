#
# Project Home:
# ============
# http://libevent.org
#
# Downloads:
# =========
# https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
# https://github.com/libevent/libevent/releases/download/release-${VERSION}-stable/libevent-${VERSION}-stable.tar.gz
#

url         = https://github.com/libevent/libevent/releases/download

versions    = 2.0.22-stable 2.1.11-stable 2.1.12-stable
pkgname     = libevent
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[\.][0-9]*[\.][0-9]*[\-][a-z]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/release-$$version/$$tarball ; \
	done

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
