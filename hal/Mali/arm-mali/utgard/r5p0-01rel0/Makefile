#
# Project Home:
# ============
# http://malideveloper.arm.com/develop-for-mali/drivers/arm-mali-utgard-gpu-user-space-drivers
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads/drivers/binary/utgard
#

url         = http://malideveloper.arm.com/downloads/drivers/binary/utgard

version     = r5p0-01rel0

#
#                                                           |           CPU |          OS |  HWREV
# ==========================================================+===============+=============+========
#                                                           |               |             |
#  HiKey:                                                   |               |             |
# ----------------------------------------------------------+---------------+-------------+--------
#    mali-450_r5p0-01rel0_linux_1+fbdev+arm64-v8a.tar.gz    | ARMv8 AArch64 |   GNU/Linux |  r0p0
#                                                           |               |             |
# ----------------------------------------------------------+---------------+-------------+--------
#
tarballs    = mali-450_$(version)_linux_1+fbdev+arm64-v8a.tar.gz

sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$(version)/$$tarball ; \
	done

$(sha1s): $(tarballs)
	@for tarball in $^ ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
