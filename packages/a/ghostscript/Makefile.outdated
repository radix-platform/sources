#
# Project Home:
# ============
# http://www.ghostscript.com
#
# Downloads:
# =========
# http://www.ghostscript.com/download/gsdnld.html
# http://downloads.ghostscript.com/public
#

url         = http://downloads.ghostscript.com/public

versions    = 9.07 9.15 9.16 9.18
pkgname     = ghostscript
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarball =======\n"
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
