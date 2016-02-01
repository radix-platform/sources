#
# Project Home:
# ============
# http://sourceforge.net/p/log4cplus/wiki/Home
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/${VERSION}
#

url         = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable

versions    = 1.2.0-rc3 1.2.0
pkgname     = log4cplus
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.][0-9]*[\.][0-9]*\)\(.*\)/\3/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
