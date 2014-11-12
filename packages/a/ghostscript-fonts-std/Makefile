#
# Project Home:
# ============
# http://sourceforge.net/projects/gs-fonts
# https://code.google.com/p/ghostscript
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11 (base 35, GPL)
# http://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11 %28base 35%2c GPL%29
#
# Google Code:
# ===========
# https://code.google.com/p/ghostscript/downloads/list
# https://ghostscript.googlecode.com/files/ghostscript-fonts-std-8.11.tar.gz
#

url         = https://ghostscript.googlecode.com/files

versions    = 8.11
pkgname     = ghostscript-fonts-std
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
