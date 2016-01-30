#
# Project Home:
# ============
# http://www.courtesan.com
#
# Downloads:
# =========
# http://www.courtesan.com/sudo/download.html
#  FTP: ftp://ftp.sudo.ws/pub/sudo
# HTTP: http://www.courtesan.com/sudo/dist
#

url         = ftp://ftp.sudo.ws/pub/sudo

versions    = 1.8.6p8 1.8.11p2 1.8.12 1.8.13 1.8.14 1.8.15
pkgname     = sudo
suffix      = tar.gz
sign_suffix = sig

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
