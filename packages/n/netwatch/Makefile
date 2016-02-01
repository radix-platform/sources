#
# Project Home:
# ============
# http://www.slctech.org/~mackay/NETWATCH/netwatch.html
#
# Downloads:
# =========
# http://www.slctech.org/~mackay/NETWATCH/netwatch-1.3.0-1.tgz
#

url          = http://www.slctech.org/~mackay/NETWATCH

versions     = 1.3.0-1 1.3.1-2
pkgname      = netwatch
suffix       = tar.gz

tarballs     = $(foreach v,$(versions),\
                 $(addsuffix .$(suffix), $(addprefix $(pkgname)-,\
                   $(shell echo $(v) | cut -f 1 -d '-'))))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for v in $(versions) ; do \
	  version=`echo $$v | cut -f 1 -d '-'` ; \
	  release=`echo $$v | cut -f 2 -d '-'` ; \
	  wget -N $(url)/$(pkgname)-$$version-$$release.tgz ; \
	  tar xzf $(pkgname)-$$version-$$release.tgz ; \
	  if [ -d $(pkgname)-$$version-$$release ] ; then \
	    mv $(pkgname)-$$version-$$release $(pkgname)-$$version ; \
	  fi ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version-$$release.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
