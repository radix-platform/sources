#
# Project Home:
# ============
# https://www.gnu.org/software/libidn
#
# Downloads:
# =========
# ftp://ftp.gnu.org/gnu/libidn
#

url         = https://ftp.gnu.org/gnu/libidn

lib_name    = libidn

versions    = 2.2.0
pkgname     = libidn2
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

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
