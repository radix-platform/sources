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

all: $(tarballs)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs ======="
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

downloads_clean:
	@rm -rf $(tarballs)
