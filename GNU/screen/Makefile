#
# Project Home:
# ============
# http://www.gnu.org/software/screen
#
# Downloads:
# =========
# ftp://ftp.gnu.org/gnu/screen
#

url         = ftp://ftp.gnu.org/gnu/screen

versions    = 4.7.0 4.8.0
pkgname     = screen
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
patches     = $(addsuffix -patches.$(suffix), $(addprefix $(pkgname)-, $(versions)))

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
