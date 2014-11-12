#
# Project Home:
# ============
# http://sourceforge.net/projects/dc3dd
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/dc3dd/dc3dd/${VERSION}
#

url         = http://downloads.sourceforge.net/project/dc3dd/dc3dd

versions    = 7.1.614 7.2.641
pkgname     = dc3dd
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version= ; \
	  vers=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  if [ "`echo $$vers | cut -f1,2 -d'.'`" == "7.1" ] ; then \
	    version=7.1.0 ; \
	  elif [ "`echo $$vers | cut -f1,2 -d'.'`" == "7.2" ] ; then \
	    version=7.2 ; \
	  fi ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
