#
# Project Home:
# ============
# http://www.bzip.org/
#
# Downloads:
# =========
# http://www.bzip.org/1.0.5/bzip2-1.0.5.tar.gz
# http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
#

url         = http://www.bzip.org

versions    = 1.0.5 1.0.6
pkgname     = bzip2
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\(^[a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
