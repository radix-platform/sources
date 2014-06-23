#
# Project Home:
# ============
# http://libcg.sourceforge.net
# http://sourceforge.net/projects/libcg
#
# Downloads:
# =========
# http://sourceforge.net/projects/libcg/files/libcgroup
#

url         = http://sourceforge.net/projects/libcg/files/libcgroup

versions    = 0.38 0.41
pkgname     = libcgroup
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9]*\)\([\.].*\)/\2/'`; \
	  if [ $$version == "0.38" ]; then \
	    vers=v.`echo $$version | sed 's/\.//g'`; \
	  else \
	    vers=v`echo $$version`; \
	  fi ; \
	  wget -N $(url)/$$vers/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
