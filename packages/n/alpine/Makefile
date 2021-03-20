#
# Project Home:
# ============
# http://patches.freeiz.com/alpine
#
# Git:
# ===
# https://repo.or.cz/alpine.git
#
# Downloads:
# =========
# http://patches.freeiz.com/alpine/release
# http://alpine.x10host.com/alpine/release/src
#

url         = http://alpine.x10host.com/alpine/release/src

versions    = 2.11 2.20 2.21 2.24
pkgname     = alpine
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
