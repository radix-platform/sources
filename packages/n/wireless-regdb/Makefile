#
# Project Home:
# ============
# http://wireless.kernel.org/en/developers/Regulatory/CRDA
#
# Downloads:
# =========
# http://wireless.kernel.org/download/crda
# https://www.kernel.org/pub/software/network/wireless-regdb
#

url         = https://www.kernel.org/pub/software/network/wireless-regdb

versions    = 2014.10.07 2014.11.07 2015.12.14 2019.06.03 2020.11.20 2021.04.21
pkgname     = wireless-regdb
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	   wget -N $(url)/$(pkgname)-$$version.$(suffix) ;  \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
