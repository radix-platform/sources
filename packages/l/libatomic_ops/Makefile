#
# Project Home:
# ============
# http://www.hboehm.info/gc
# https://github.com/ivmai/libatomic_ops/wiki/Download
#
# Downloads:
# =========
# http://www.ivmaisoft.com/_bin/atomic_ops
#

url         = http://www.ivmaisoft.com/_bin/atomic_ops

versions    = 7.4.2 7.4.14 7.6.10
pkgname     = libatomic_ops
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

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
