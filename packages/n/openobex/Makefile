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
# https://downloads.sourceforge.net/project/openobex/files/openobex/${VERSION}
#

url         = https://downloads.sourceforge.net/project/openobex/openobex

versions    = 1.7.2
pkgname     = openobex
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkgname)-$${version}-Source.$(suffix) ; \
	  tar xzf $(pkgname)-$${version}-Source.$(suffix) ; \
	  rm -f $(pkgname)-$${version}-Source.$(suffix) ; \
	  mv $(pkgname)-$${version}-Source $(pkgname)-$$version ; \
	  tar cjf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
