#
# Project Home:
# ============
# http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge
# http://sourceforge.net/projects/bridge
#
# Downloads:
# =========
# https://mirrors.edge.kernel.org/pub/linux/utils/net/bridge-utils
#

url         = https://mirrors.edge.kernel.org/pub/linux/utils/net/bridge-utils

versions    = 1.6
pkgname     = bridge-utils
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
