#
# Project Home:
# ============
# http://www.nongnu.org/libunwind
#
# Downloads:
# =========
# http://download.savannah.nongnu.org/releases/libunwind
#

url         = http://download.savannah.nongnu.org/releases/libunwind

versions    = 1.1 1.2 1.2.1
pkgname     = libunwind
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
