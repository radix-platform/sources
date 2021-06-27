#
# Project Home:
# ============
# http://www.denx.de/wiki/U-Boot/
#
# FTP snapshots:
# =============
# ftp://ftp.denx.de/pub/u-boot/
#
# HTTP snapshots:
# ==============
# https://ftp.denx.de/pub/u-boot/
#

url         = http://ftp.denx.de/pub/u-boot

versions    = 2013.10 2014.01 2014.07 2014.10 2015.01 2015.04 2015.07 2016.01
versions   += 2017.09 2017.11 2018.11 2019.10 2020.10 2021.04

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
