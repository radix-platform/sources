#
# Project Home:
# ============
# http://www.tin.org
#
# Downloads:
# =========
# ftp://ftp.tin.org/pub/news/clients/tin
#

url         = ftp://ftp.tin.org/pub/news/clients/tin

versions    = 2.1.5 2.2.1 2.3.2 2.4.3
pkgname     = tin
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  major=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/v$$major/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
