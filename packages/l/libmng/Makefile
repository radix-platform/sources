#
# Project Home:
# ============
# http://libmng.com
# http://sourceforge.net/projects/libmng
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/libmng/libmng-devel/${VERSION}
#

url         = http://downloads.sourceforge.net/project/libmng/libmng-devel

versions    = 2.0.2
pkgname     = libmng
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9][.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
