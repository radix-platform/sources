#
# Project Home:
# ============
# https://www.postgresql.org
#
# Downloads:
# =========
# http://ftp.postgresql.org/pub/source/v${VERSION}
#

url         = http://ftp.postgresql.org/pub/source

versions    = 9.5.4 9.6.0
pkgname     = postgresql
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.][0-9]*[\.][0-9]*\)\([\.].*\)/\3/'` ; \
	  wget -N $(url)/v$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
