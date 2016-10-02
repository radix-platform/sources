#
# Project Home:
# ============
# https://github.com/OpenMandrivaAssociation/ladspa
#
# Downloads:
# =========
# https://github.com/OpenMandrivaAssociation/ladspa/raw/master/${pkgname}_sdk_${pkgver}.tgz
#

url         = https://github.com/OpenMandrivaAssociation/ladspa/raw/master

versions    = 1.13
pkgname     = ladspa
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.][0-9]*\)\([\.].*\)/\3/'` ; \
	  wget -N $(url)/$(pkgname)_sdk_$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.][0-9]*\)\([\.].*\)/\3/'` ; \
	  tar xzf $(pkgname)_sdk_$$version.tgz ; \
	  mv $(pkgname)_sdk $(pkgname)-$$version ; \
	  rm -rf $(pkgname)_sdk $(pkgname)_sdk_$$version.tgz ; \
	  tar czf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
