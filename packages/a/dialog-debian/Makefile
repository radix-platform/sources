#
# Project Home:
# ============
# http://hightek.org/dialog/
#
# Downloads:
# =========
# ftp://ftp.us.debian.org/debian/pool/main/d/dialog/
#

url          = ftp://ftp.de.debian.org/debian/pool/main/d/dialog

old_versions = 1.2-20140112
versions     = 1.1-20120215 1.2-20140219

tarballs     = $(addsuffix .orig.tar.gz, $(addprefix dialog_, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))


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
