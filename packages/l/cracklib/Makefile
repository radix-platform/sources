#
# Project Home:
# ============
# http://sourceforge.net/projects/cracklib
#
# Downloads:
# =========
# http://sourceforge.net/projects/cracklib/files/cracklib
#

url         = http://sourceforge.net/projects/cracklib/files/cracklib

versions    = 2.8.22 2.9.0 2.9.1 2.9.5
pkgname     = cracklib
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
