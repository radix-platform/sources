#
# Project Home:
# ============
# https://www.python.org
#
# Downloads:
# =========
# http://docs.python.org/2/archives
#

url         = https://docs.python.org/ftp/python/doc

versions    = 2.7.6 2.7.11 2.7.12 2.7.13 2.7.14
pkgname     = python
suffix      = tar.bz2
formats     = text html pdf-a4

tarballs    = $(foreach format, $(formats), $(addsuffix -docs-$(format).$(suffix), $(addprefix $(pkgname)-, $(versions))))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.][0-9]*[.][0-9]*\)\([\-].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
