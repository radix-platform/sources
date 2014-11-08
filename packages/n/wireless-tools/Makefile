#
# Project Home:
# ============
# http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
# http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html
#
# Downloads:
# =========
# http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
#

url         = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux

versions    = 28 29
pkgname     = wireless-tools
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/wireless_tools.$$version.tar.gz ; \
	  tar xzf wireless_tools.$$version.tar.gz ; \
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
