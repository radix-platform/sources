#
# Project Home:
# ============
# http://gimp-print.sourceforge.net
#
# Downloads:
# =========
# http://gimp-print.sourceforge.net/p_Download.php
# http://downloads.sourceforge.net/project/gimp-print/gutenprint-5.2/${VERSION}
#

url         = http://downloads.sourceforge.net/project/gimp-print

versions    = 5.2.9 5.2.10
pkgname     = gutenprint
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  major_minor=`echo $$version | cut -f1,2 -d'.'` ; \
	  wget -N $(url)/$(pkgname)-$$major_minor/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
