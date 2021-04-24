#
# Project Home:
# ============
# https://iodbc.org
# https://www.iodbc.org/dataspace/iodbc/wiki/iODBC
#
# Downloads:
# =========
# https://dist.libuv.org/dist
#

url         = https://dist.libuv.org/dist

versions    = v1.41.0
pkgname     = libuv
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.gz\)/\2/'` ; \
	  wget -N $(url)/v$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
