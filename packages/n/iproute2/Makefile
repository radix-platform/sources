#
# Project Home:
# ============
# http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
#
# Downloads:
# =========
# https://www.kernel.org/pub/linux/utils/net/iproute2
#

url         = https://www.kernel.org/pub/linux/utils/net/iproute2

versions    = 3.4.0 3.5.0 3.8.0 3.9.0 3.10.0 3.11.0 3.12.0 3.14.0 3.15.0 3.16.0
versions   += 4.4.0 4.5.0 5.3.0
pkgname     = iproute2
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
