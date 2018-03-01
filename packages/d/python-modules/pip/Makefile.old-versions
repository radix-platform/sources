#
# Project Home:
# ============
# https://pip.pypa.io
#
# Downloads:
# =========
# https://pypi.python.org/pypi/pip
# https://pypi.python.org/packages/source/p/pip/pip-7.1.2.tar.gz
#

url         = https://pypi.python.org/packages/source/p/pip

versions    = 7.1.2 8.1.1
pkgname     = pip
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
