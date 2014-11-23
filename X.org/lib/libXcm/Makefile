#
# Project Home:
# ============
# http://www.oyranos.org/libxcm
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/oyranos/libXcm/libXcm-${MAJR_MINOR}
#

url         = http://downloads.sourceforge.net/project/oyranos/libXcm

versions    = 0.4.2 0.5.2 0.5.3
pkgname     = libXcm
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  directory= ; \
	  vers=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9]*\)\(\..*\)/\2/'` ; \
	  if [ "`echo $$vers | cut -f1,2 -d'.'`" == "0.5" ] ; then \
	    directory=libXcm-0.5 ; \
	  else \
	    directory=libXcm-$$vers.x ; \
	  fi ; \
	  wget -N $(url)/$$directory/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
