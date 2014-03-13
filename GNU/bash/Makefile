#
# Project Home:
# ============
# http://www.gnu.org/software/bash/bash.html
#
# Downloads:
# =========
# ftp://ftp.cwru.edu/pub/bash/
#

url         = ftp://ftp.cwru.edu/pub/bash

versions    = 4.2 4.3
pkgname     = bash
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
patches     = $(addsuffix -patches.$(suffix), $(addprefix $(pkgname)-, $(versions)))

sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ; \
	  mkdir $(pkgname)-$$version-patches ; \
	  cd $(pkgname)-$$version-patches ; \
	  wget -rnd -nv $(url)/$(pkgname)-$$version-patches ; \
	  if [ "" != "`find -iname '$(pkgname)*' -exec echo '{}' \; -quit`" ] ; then \
	    cd .. ; \
	    tar czf $(pkgname)-$$version-patches.$(suffix) $(pkgname)-$$version-patches ; \
	    mv $(pkgname)-$$version-patches $(pkgname)-$$version-patched ; \
	    tar xzf $(pkgname)-$$version.$(suffix) ; \
	    ( cd $(pkgname)-$$version ; \
	      for file in ../$(pkgname)-$$version-patched/$(pkgname)??-??? ; do patch -p0 --batch < $$file ; done \
	    ) ; \
	    mv $(pkgname)-$$version-patched $(pkgname)-$$version-patches ; \
	    tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	    rm -rf $(pkgname)-$$version ; \
	  else \
	    cd .. ; \
	  fi ; \
	  rm -rf $(pkgname)-$$version-patches ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for version in $(versions) ; do \
	  echo -e "\n======= Calculation the '$(pkgname)-$$version.$(suffix)' sha1sum =======\n" ; \
	  sha1sum --binary $(pkgname)-$$version.$(suffix) > $(pkgname)-$$version.$(suffix).sha1sum ; \
	  if [ -f $(pkgname)-$$version-patches.$(suffix) ] ; then \
	    sha1sum --binary $(pkgname)-$$version-patches.$(suffix) > $(pkgname)-$$version-patches.$(suffix).sha1sum ; \
	  fi ; \
	done

downloads_clean:
	@rm -rf *.$(suffix) *.sha1sum
