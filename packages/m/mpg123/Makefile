#
# Project Home:
# ============
# http://www.mpg123.de
#
# Downloads:
# =========
# http://www.mpg123.de/download.shtml
# http://sourceforge.net/projects/setserial/files/setserial/2.17/
#

url         = http://sourceforge.net/projects/mpg123/files/mpg123

versions    = 1.20.0 1.20.1
pkgname     = mpg123
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9][\.][0-9]*[\.][0-9]*\)\([\.].*\)/\3/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
