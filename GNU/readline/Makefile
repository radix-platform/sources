#
# Project Home:
# ============
# http://www.gnu.org/software/bash/bash.html
#
# Downloads:
# =========
# ftp://ftp.cwru.edu/pub/bash/
#

url         = https://ftp.gnu.org/gnu/readline

cutdirs     = 4

versions    = 6.2 6.3 8.0 8.1
pkgname     = readline
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
patches     = $(addsuffix -patches.$(suffix), $(addprefix $(pkgname)-, $(versions)))

sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  v=`echo $$version | sed 's,\.,,g'` ; \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ; \
	  mkdir $(pkgname)-$$version-patches ; \
	  wget -nH -r --cut-dirs=$(cutdirs) -P $(pkgname)-$$version-patches \
	              --accept-regex "$(pkgname)$$v-*"             \
	              $(url)/$(pkgname)-$$version-patches/ ; \
	  rm -f $(pkgname)-$$version-patches/index.html ; \
	  cd $(pkgname)-$$version-patches ; \
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
