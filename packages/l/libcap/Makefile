#
# Project Home:
# ============
# https://sites.google.com/site/fullycapable
#
# Downloads:
# =========
# https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
#

url         = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2

versions    = 2.22 2.24 2.25
pkgname     = libcap
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

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
