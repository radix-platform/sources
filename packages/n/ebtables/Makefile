#
# Project Home:
# ============
# http://ebtables.netfilter.org
#
# Downloads:
# =========
# http://ebtables.netfilter.org/downloads/latest.html
#

url         = ftp://ftp.netfilter.org/pub/ebtables

versions    = 2.0.10-4
pkgname     = ebtables
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-v$$version.$(suffix) ; \
	  tar xzf $(pkgname)-v$$version.$(suffix) ; \
	  mv $(pkgname)-v$$version $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-v$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
