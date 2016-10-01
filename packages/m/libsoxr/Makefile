#
# Project Home:
# ============
# http://sourceforge.net/p/soxr/wiki/Home
#
# Downloads:
# =========
# http://sourceforge.net/projects/soxr/files
#

url         = http://sourceforge.net/projects/soxr/files

versions    = 0.1.2
pkgname     = soxr
suffix      = tar.xz

tarballs    = $(addsuffix -Source.$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
