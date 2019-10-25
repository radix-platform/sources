#
# Project Home:
# ============
# http://e2fsprogs.sourceforge.net
#
# Downloads:
# =========
# https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.4/
#

url         = https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs

versions    = 1.42.8 1.42.9 1.45.4
pkgname     = e2fsprogs
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-z0-9A-Z-]*\)\([0-9][.0-9][0-9][.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
