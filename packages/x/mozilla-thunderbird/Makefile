#
# Project Home:
# ============
# http://www-archive.mozilla.org/projects/thunderbird/index.html
#
# Downloads:
# =========
# http://download.cdn.mozilla.net/pub/thunderbird/releases/${VERSION}
#

url         = http://download.cdn.mozilla.net/pub/thunderbird/releases

versions    = 45.0 45.8.0
pkgname     = thunderbird
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addsuffix .source, $(addprefix $(pkgname)-, $(versions))))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/$$version/source/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
