#
# Project Home:
# ============
# http://freecode.com/projects/isl
# http://isl.gforge.inria.fr/
#
# Downloads:
# =========
# http://isl.gforge.inria.fr/
#

url         = http://isl.gforge.inria.fr

versions    = 0.15 0.16 0.16.1 0.17 0.17.1 0.18 0.19 0.20 0.22 0.22.1

tarballs    = $(addsuffix .tar.xz, $(addprefix isl-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
