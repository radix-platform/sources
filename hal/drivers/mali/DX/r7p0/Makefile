#
# Project Home:
# ============
# http://malideveloper.arm.com/resources/drivers/open-source-mali-utgard-gpu-linux-kernel-drivers
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads/drivers/DX910
#

url         = http://malideveloper.arm.com/downloads/drivers/DX910

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
	  wget -N $(url)/$$version/$(pkgname)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
