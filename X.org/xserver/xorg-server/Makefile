#
# Project Home:
# ============
# http://www.x.org/wiki
#
# Downloads:
# =========
# http://www.x.org/releases/individual/xserver
#

url         = http://www.x.org/releases/individual/xserver

versions    = 1.12.2 1.12.4 1.14.2 1.14.7 1.16.2 1.16.4 1.17.2 1.17.4
versions   += 1.18.0 1.18.3 1.18.4 1.19.0 1.19.1
pkgname     = xorg-server
suffix      = tar.bz2

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
