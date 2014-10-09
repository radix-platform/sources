#
# Project Home:
# ============
# http://www.json.org
# https://github.com/json-c/json-c/wiki
# https://github.com/json-c/json-c
#
# Releases:
# https://github.com/json-c/json-c/releases
#
# Downloads:
# =========
# https://github.com/json-c/json-c/archive
#

url         = https://github.com/json-c/json-c/archive

versions    = 0.11-20130402 0.12-20140410
pkgname     = json-c
suffix      = tar.gz

tarballs    = $(foreach v,$(versions),$(addsuffix .$(suffix),$(addprefix $(pkgname)-,$(shell echo $(v) | cut -f 1 -d '-'))))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  v=`echo $$version | cut -f 1 -d '-'` ; \
	  wget -N $(url)/$(pkgname)-$${version}.$(suffix) ; \
	  tar xzf $(pkgname)-$${version}.$(suffix) ; \
	  rm -f $(pkgname)-$${version}.$(suffix) ; \
	  mv $(pkgname)-$(pkgname)-$${version} $(pkgname)-$$v ; \
	  tar czf $(pkgname)-$$v.$(suffix) $(pkgname)-$$v ; \
	  rm -rf $(pkgname)-$$v ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
