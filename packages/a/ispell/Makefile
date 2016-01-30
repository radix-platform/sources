#
# Project Home:
# ============
# http://www.lasr.cs.ucla.edu/geoff
#
# Downloads:
# =========
# http://www.lasr.cs.ucla.edu/geoff/tars
#

url         = http://www.lasr.cs.ucla.edu/geoff/tars

versions    = 3.2.06 3.3.00 3.3.01 3.3.02 3.4.00
pkgname     = ispell
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
