#
# Project Home:
# ============
# https://packages.debian.org/source/stable/shadow
#
# Downloads:
# =========
# http://ftp.de.debian.org/debian/pool/main/s/shadow
# http://cdn.debian.net/debian/pool/main/s/shadow
#

url         = http://pkg-shadow.alioth.debian.org/releases

version     = 4.2 4.2.1
pkgname     = shadow
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
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
