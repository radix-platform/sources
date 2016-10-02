#
# Project Home:
# ============
# https://bitbucket.org/multicoreware/x265/wiki/Home
#
# Downloads:
# =========
# https://bitbucket.org/multicoreware/x265/downloads
#

url         = https://bitbucket.org/multicoreware/x265/downloads

versions    = 2.0 2.1
pkgname     = x265
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs |$(tarballs)|=======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.][0-9]*\)\([\.].*\)/\3/'` ; \
	  wget -N $(url)/$(pkgname)_$$version.tar.gz ; \
	  tar xzf $(pkgname)_$$version.tar.gz ; \
	  mv $(pkgname)_$$version $(pkgname)-$$version ; \
	  rm -rf $(pkgname)_$$version $(pkgname)_$$version.tar.gz ; \
	  tar czf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
