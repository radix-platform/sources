#
# Project Home:
# ============
# http://www.denx.de/wiki/U-Boot/
#
# FTP snapshots:
# =============
# ftp://ftp.denx.de/pub/u-boot/
#

url         = ftp://ftp.denx.de/pub/u-boot

versions    = 2013.10 2014.01 2014.07

tarballs    = $(addsuffix .tar.bz2, $(addprefix u-boot-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
