#
# Project Home:
# ============
# https://packages.qa.debian.org/d/debianutils.html
#
# Downloads:
# =========
# ftp://ftp.de.debian.org/debian/pool/main/d/debianutils
#

url        = ftp://ftp.de.debian.org/debian/pool/main/d/debianutils

versions   = 4.11.2

pkgname    = debianutils
tarballs   = $(addsuffix .tar.xz, $(addprefix $(pkgname)_, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
