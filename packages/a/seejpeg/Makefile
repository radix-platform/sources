#
# Project Home:
# ============
# [ http://www.ibiblio.org/pub/Linux/apps/graphics/viewers/svga ]
#
# Downloads:
# =========
# http://www.ibiblio.org/pub/Linux/apps/graphics/viewers/svga
#

url         = http://www.ibiblio.org/pub/Linux/apps/graphics/viewers/svga

versions    = 1.10
pkgname     = seejpeg
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))
description = $(addsuffix .lsm, $(addprefix $(pkgname)-, $(versions)))

files       = $(description)


all: $(tarballs) $(files) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tgz ; \
	  tar xzf $(pkgname)-$$version.tgz ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tgz ; \
	done

$(files): $(tarballs)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(files) $(sha1s)
