#
# Project Home:
# ============
# https://www.mozilla.org/en-US/firefox/new
#
# Downloads:
# =========
# https://ftp.mozilla.org/pub/firefox/releases/$(VERSION)/
#

url         = https://ftp.mozilla.org/pub/firefox/releases

versions    = 44.0 45.0.1 45.0.2 52.0 70.0
pkgname     = firefox
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
