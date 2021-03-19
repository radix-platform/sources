#
# Project Home:
# ============
# ftp://ftp.radix.pro/radix/tools/jsmin
#
# Downloads:
# =========
# ftp://ftp.radix.pro/radix/tools/jsmin
#

url          = https://ftp.radix.pro/radix/tools/jsmin

versions     = 0.0.1
pkgname      = jsmin

tarballs     = $(addsuffix .tar.gz, $(addprefix $(pkgname)-, $(versions)))
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
