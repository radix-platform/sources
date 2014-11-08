#
# Project Home:
# ============
# This is an very old product 'portmap-6.0.tgz'
#
# Downloads:
# =========
# http://fossies.org/linux/misc/old/portmap-6.0.tar.xz
#

url         = http://fossies.org/linux/misc/old

versions    = 6.0
pkgname     = portmap
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ; \
	  tar xJf $(pkgname)-$$version.$(suffix) ; \
	  rm -f $(pkgname)-$$version.$(suffix) ; \
	  mv $(pkgname)_$$version $(pkgname)-$$version ; \
	  tar cJf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
