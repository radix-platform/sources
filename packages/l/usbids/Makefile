#
# Project Home:
# ============
# http://www.linux-usb.org
#
# Downloads:
# =========
# http://www.linux-usb.org/usb.ids
#

url         = http://www.linux-usb.org

version     = $(shell echo `date +%Y%m%d`)
pkgname     = usbids
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@wget -N $(url)/usb.ids
	@tar cJvf $(tarball) usb.ids
	@rm -f usb.ids

$(sha1s): $(tarball)
	@echo -e "\n======= Calculation the '$(tarball)' sha1sum =======\n"
	@sha1sum --binary $(tarball) > $(tarball).sha1sum ; \

downloads_clean:
	@rm -rf usbids-*$(suffix) usbids-*$(suffix).sha1sum
