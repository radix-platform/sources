#
# Project Home:
# ============
# http://www.ex-parrot.com/~pdw/iftop
#
# Downloads:
# =========
# http://www.ex-parrot.com/~pdw/iftop/download
#

url          = http://www.ex-parrot.com/~pdw/iftop/download

versions     = 0.17 1.0pre2 1.0pre4
pkgname      = iftop
suffix       = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

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
