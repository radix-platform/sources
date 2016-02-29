#
# Project Home:
# ============
# http://www.sourceware.org/newlib/
#
# Source snapshots:
# ================
# ftp://sources.redhat.com/pub/newlib/newlib-1.18.0.tar.gz
# ftp://sources.redhat.com/pub/newlib/newlib-1.20.0.tar.gz
#

url         = ftp://sources.redhat.com/pub/newlib

tarballs    = newlib-1.14.0.tar.gz
tarballs   += newlib-1.18.0.tar.gz
tarballs   += newlib-1.20.0.tar.gz
tarballs   += newlib-2.3.0.20160226.tar.gz

sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
