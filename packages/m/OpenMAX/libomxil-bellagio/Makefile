#
# Project Home:
# ============
# http://omxil.sourceforge.net
#
# Downloads:
# =========
# http://omxil.sourceforge.net/downloads.html
# http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20${VERSION}
#

url         = http://downloads.sourceforge.net/project/omxil/omxil

versions    = 0.9.3
pkgname     = libomxil-bellagio
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/Bellagio%20$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
