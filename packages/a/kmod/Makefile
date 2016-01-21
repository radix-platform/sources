#
# Project Home:
# ============
# ftp://ftp.kernel.org/pub/linux/utils/kernel/kmod/
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/utils/kernel/kmod/
#

url         = ftp://ftp.kernel.org/pub/linux/utils/kernel/kmod

versions    = 16 22
pkg_name    = kmod
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
