#
# Project Home:
# ============
# https://ieee1394.wiki.kernel.org/index.php/Main_Page
# http://www.linux1394.org
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/libs/ieee1394
#

url         = ftp://ftp.kernel.org/pub/linux/libs/ieee1394

versions    = 2.1.0 2.1.1 2.1.2
pkgname     = libraw1394
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ;  \
	done


$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
