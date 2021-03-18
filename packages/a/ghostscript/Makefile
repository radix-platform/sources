#
# Project Home:
# ============
# http://www.ghostscript.com
# https://github.com/ArtifexSoftware
#
# Downloads:
# =========
# https://github.com/ArtifexSoftware/ghostpdl-downloads
#

url         = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download

versions    = 9.53.2 9.53.3
pkgname     = ghostscript
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarball =======\n"
	@for tarball in $(tarballs) ; do \
	   version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9]*[.][0-9]*\)\(\..*\)/\2/'` ; \
	   short=`echo $$version | sed 's/\.//g'` ; \
	   wget -N $(url)/gs$$short/$$tarball ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
