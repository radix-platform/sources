#
# Project Home:
# ============
# -
#
# Downloads:
# =========
# http://software.calhariz.com/at
#

url         = http://software.calhariz.com/at

versions    = 3.1.16 3.1.20 3.1.23 3.2.1
pkgname     = at
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)_$$version.orig.tar.gz ; \
	  if [ "$$version" == "3.1.18" ] ; then \
	    mkdir $(pkgname)-$$version ; \
	    tar xzf $(pkgname)_$$version.orig.tar.gz -C $(pkgname)-$$version ; \
	  else \
	    tar xzf $(pkgname)_$$version.orig.tar.gz ; \
	  fi ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)_$$version.orig.tar.gz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
