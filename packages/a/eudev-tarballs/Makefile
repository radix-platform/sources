#
# Project Home:
# ============
# http://www.gentoo.org/proj/en/eudev
#
# GitHub:
# ======
# https://github.com/gentoo/eudev
#
# Downloads:
# =========
# http://dev.gentoo.org/~blueness/eudev
#

url         = http://dev.gentoo.org/~blueness/eudev

versions    = 1.8 1.9 3.1.5 3.2.8 3.2.9 3.2.10
pkgname     = eudev
suffix      = tar.gz

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
