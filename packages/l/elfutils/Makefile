#
# Project Home:
# ============
# https://fedorahosted.org/elfutils
#
# Downloads:
# =========
# https://fedorahosted.org/releases/e/l/elfutils/${VERSION}
#

url         = https://fedorahosted.org/releases/e/l/elfutils

versions    = 0.160 0.165 0.182
pkgname     = elfutils
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.][0-9]*\)\([\.]tar.*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
