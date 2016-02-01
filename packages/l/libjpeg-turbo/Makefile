#
# Project Home:
# ============
# http://libjpeg-turbo.virtualgl.org
# http://sourceforge.net/projects/libjpeg-turbo
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/libjpeg-turbo/${VERSION}
#

url         = http://downloads.sourceforge.net/project/libjpeg-turbo

versions    = 1.3.0 1.3.1 1.4.2
pkgname     = libjpeg-turbo
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.gz\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
