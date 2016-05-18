#
# Project Home:
# ============
# http://www.mesa3d.org
#
# Downloads:
# =========
# ftp://ftp.freedesktop.org/pub/mesa/${VERSION}
#

url         = ftp://ftp.freedesktop.org/pub/mesa

versions    = 10.5.0
pkgname     = mesa
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.][0-9]*[.][0-9]*\)\([\.]tar.*\)/\2/'` ; \
	  major=`echo $$version |  sed 's/\([a-zA-Z-]*\)\([0-9]*\)\([\.].*\)/\2/'` ; \
	  if [ "$$major" -lt "11" ] ; then \
	    subdir="older-versions/$${major}.x/$$version" ; \
	  else \
	    subdir="$$version" ; \
	  fi ; \
	  wget -N $(url)/$$subdir/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
