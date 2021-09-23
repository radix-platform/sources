#
# Project Home:
# ============
# https://www.gnu.org/software/libtasn1
#
# Downloads:
# =========
# ftp://ftp.gnu.org/gnu/libtasn1
#

url         = https://ftp.gnu.org/gnu/libtasn1

versions    = 3.3 3.4 4.3 4.7 4.14 4.15.0 4.16.0 4.17.0
pkgname     = libtasn1
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

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
