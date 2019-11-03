#
# Project Home:
# ============
# https://hewlettpackard.github.io/wireless-tools/Tools.html
#
# GitHub:
# ======
# https://github.com/HewlettPackard/wireless-tools
#
# Download:
# ========
# https://hewlettpackard.github.io/wireless-tools
#

url         = https://hewlettpackard.github.io/wireless-tools

versions    = 28 29 30
pkgname     = wireless-tools
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  if [ "$$version" -eq "30" ] ; then \
	    wget -N $(url)/wireless_tools.$$version.pre9.tar.gz ; \
	  else \
	    wget -N $(url)/wireless_tools.$$version.tar.gz ; \
	  fi ; \
	  if [ "$$version" -eq "30" ] ; then \
	    tar xzf wireless_tools.$$version.pre9.tar.gz ; \
	    rm -f wireless_tools.$$version.pre9.tar.gz ; \
	  else \
	    tar xzf wireless_tools.$$version.tar.gz ; \
	  fi ; \
	  mv wireless_tools.$$version $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version wireless_tools.$$version.tar.gz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
