#
# Project Home:
# ============
# http://www.nndev.org
#
# Downloads:
# =========
# ftp://ftp.nndev.org/pub/nn-6.7/nn-6.7.3.tar.Z
# ftp://ftp.openbsd.com/ports/distfiles
#

url         = ftp://ftp.openbsd.com/ports/distfiles

versions    = 6.7.3
pkgname     = nn
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tar.Z ; \
	  uncompress -c $(pkgname)-$$version.tar.Z | tar xf - ; \
	  tar cjf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tar.Z ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
