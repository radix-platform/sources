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

versions    = 0.12.1 0.12.2

tarballs    = $(addsuffix .tar.bz2, $(addprefix isl-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
