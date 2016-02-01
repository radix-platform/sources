#
# Project Home:
# ============
# http://www.libtiff.org
#
# Downloads:
# =========
# ftp://ftp.remotesensing.org/pub/libtiff
#

url         = ftp://ftp.remotesensing.org/pub/libtiff

versions    = 3.9.7 4.0.0 4.0.1 4.0.2 4.0.3 4.0.4 4.0.5 4.0.6
pkgname     = tiff
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
