#
# Project Home:
# ============
# https://openobex.sourceforge.net/about.html
#
# Downloads:
# =========
# https://openobex.sourceforge.net/downloads.html
#
# Files:
# =====
# https://downloads.sourceforge.net/project/openobex/files/obexfs/${VERSION}
#

url         = https://downloads.sourceforge.net/project/openobex/obexfs

versions    = 0.12
pkgname     = obexfs
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkgname)-$${version}.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
