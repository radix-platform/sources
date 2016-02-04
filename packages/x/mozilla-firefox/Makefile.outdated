#
# Project Home:
# ============
# http://www-archive.mozilla.org/projects/firefox/index.html
#
# Downloads:
# =========
# http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/$(VERSION)/
#

url         = http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases

versions    = 32.0 32.0.2 32.0.3 33.0.3 34.0.5 35.0.1 40.0.2
pkgname     = firefox
suffix      = tar.bz2

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
