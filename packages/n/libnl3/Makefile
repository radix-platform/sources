#
# Project Home:
# ============
# http://www.infradead.org/~tgr/libnl
#
# Downloads:
# =========
# http://www.infradead.org/~tgr/libnl/files
#

url         = https://github.com/thom311/libnl/releases/download

versions    = 3.2.25 3.2.27 3.5.0
pkgname     = libnl
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9][.][0-9]*\)\([\.].*\)/\2/' | sed 's/\./_/g'` ; \
	  wget -N $(url)/$(pkgname)$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
