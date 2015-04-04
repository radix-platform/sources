#
# Project Home:
# ============
# http://malideveloper.arm.com/develop-for-mali/features/mali-t6xx-gpu-user-space-drivers
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads/drivers/binary
#

url         = http://malideveloper.arm.com/downloads/drivers/binary

version     = r5p0-06rel0

#
#                                                           |    CPU |          OS |  HWREV
# ==========================================================+========+=============+========
#                                                           |        |             |
#  FireFly:                                                 |        |             |
# ----------------------------------------------------------+--------+-------------+--------
#    mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz             |  ARMv7 |   GNU/Linux |  r0p0
#                                                           |        |             |
# ----------------------------------------------------------+--------+-------------+--------
#                                                           |        |             |
#  Arndale Octa, Samsung Chromebook 2 (XE503C12, XE503C32): |        |             |
# ----------------------------------------------------------+--------+-------------+--------
#    mali-t62x_r5p0-06rel0_linux_1+x11.tar.gz               |  ARMv7 |   GNU/Linux |  r0p1
#    mali-t62x_r5p0-06rel0_linux_1+fbdev.tar.gz             |  ARMv7 |   GNU/Linux |  r0p1
#                                                           |        |             |
# ----------------------------------------------------------+--------+-------------+--------
#                                                           |        |             |
#  Arndale, Samsung Chromebook 1 (XE303C12):                |        |             |
# ----------------------------------------------------------+--------+-------------+--------
#    mali-t60x_r5p0-06rel0_linux_1+x11.tar.gz               |  ARMv7 |   GNU/Linux |  r0p0
#    mali-t60x_r5p0-06rel0_linux_1+fbdev.tar.gz             |  ARMv7 |   GNU/Linux |  r0p0
#                                                           |        |             |
# ----------------------------------------------------------+--------+-------------+--------
tarballs    = mali-t76x_$(version)_linux_1+fbdev.tar.gz \
                                                        \
              mali-t62x_$(version)_linux_1+x11.tar.gz   \
              mali-t62x_$(version)_linux_1+fbdev.tar.gz \
                                                        \
              mali-t60x_$(version)_linux_1+x11.tar.gz   \
              mali-t60x_$(version)_linux_1+fbdev.tar.gz


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
