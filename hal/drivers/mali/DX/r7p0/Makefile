#
# Project Home:
# ============
# https://developer.arm.com/tools-and-software/graphics-and-gaming/mali-drivers/utgard-kernel
#
# Downloads:
# =========
# https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-utgard-gpu
#

url         = https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-utgard-gpu

versions    = r7p0-00rel0

pkgname     = DX910-SW-99002
suffix      = tgz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarball) $(sha1s)

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
