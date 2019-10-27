#
# Project Home:
# ============
# https://www.gnu.org/software/ed
#
# Downloads:
# =========
# http://ftp.gnu.org/gnu/ed
#

url         = http://ftp.gnu.org/gnu/ed

versions    = 1.15
pkgname     = ed
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tar.lz ; \
	  lzip -d $(pkgname)-$$version.tar.lz ; \
	  xz $(pkgname)-$$version.tar ; \
	  rm -f $(pkgname)-$$version.tar.lz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
