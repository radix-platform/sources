#
# Project Home:
# ============
# https://www.kernel.org/pub/software/network/ethtool
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/software/network/tftp/tftp-hpa
#

url         = ftp://ftp.kernel.org/pub/software/network/ethtool

versions    = 2.6.36 3.0 3.4 3.5 3.8 3.9 3.10 3.11 3.12 3.18
pkgname     = ethtool
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
