#
# Project Home:
# ============
# https://pypi.python.org/pypi/setuptools
#
# Downloads:
# =========
# https://github.com/pypa/setuptools/releases
#

url         = https://github.com/pypa/setuptools/archive

versions    = 20.10.1
pkgname     = setuptools
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/v$$version.$(suffix) ; \
	  mv v$$version.$(suffix) $(pkgname)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
