#
# Project Home:
# ============
# https://freedesktop.org/software/libqmi
#
# Downloads:
# =========
# https://freedesktop.org/software/libqmi
#

url         = https://freedesktop.org/software/libqmi

versions    = 1.4.0 1.6.0 1.8.0 1.10.0 1.10.2 1.10.4 1.12.6 1.12.10 1.14.2 1.24.0 1.28.2
pkgname     = libqmi
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
