#
# Project Home:
# ============
# http://www.gnu.org/software/automake
#
# Downloads:
# =========
# http://ftp.gnu.org/gnu/automake
#

url         = ftp://ftp.gnu.org/gnu/automake

versions    = 1.11.5 1.12.6 1.14 1.15 1.16 1.16.1 1.16.3 1.16.4 1.16.5
pkgname     = automake
suffix      = tar.xz

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
