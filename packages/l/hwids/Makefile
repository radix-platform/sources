#
# Project Home:
# ============
# https://standards.ieee.org/products-services/regauth/oui/index.html
#
# Downloads:
# =========
# https://regauth.standards.ieee.org/standards-ra-web/pub/view.html#registries :
# -----------------------------------------------------------------------------
# 1. MAC Address Block Large  (MA-L) :  http://standards-oui.ieee.org/oui/oui.txt
# 2. MAC Address Block Medium (MA-M) :  http://standards-oui.ieee.org/oui28/mam.txt
# 3. MAC Address Block Small  (MA-S) :  http://standards-oui.ieee.org/oui36/oui36.txt
# 4. Company ID                      :  http://standards-oui.ieee.org/cid/cid.txt
# 5. Ethertype                       :  http://standards-oui.ieee.org/ethertype/eth.txt
# 6. ManufacturerID                  :  http://standards-oui.ieee.org/manid/manid.txt
# 7. IEEE 802.16 Operator ID         :  http://standards-oui.ieee.org/bopid/opid.txt
# 8. IAB                             :  http://standards-oui.ieee.org/iab/iab.txt
#

PCI   ?= no
USB   ?= no
MAC   ?= yes
CID   ?= no
ETH   ?= no
IAB   ?= no
MANID ?= no
OPID  ?= no
SDIO  ?= yes

DATA_FILES-yes       =
DATA_FILES-$(PCI)   += pci.ids
DATA_FILES-$(USB)   += usb.ids
DATA_FILES-$(MAC)   += ma-large.txt ma-medium.txt ma-small.txt
DATA_FILES-$(CID)   += cid.txt
DATA_FILES-$(ETH)   += eth.txt
DATA_FILES-$(IAB)   += iab.txt
DATA_FILES-$(MANID) += manid.txt
DATA_FILES-$(OPID)  += opid.txt
DATA_FILES-$(SDIO)  += sdio.ids

SYSTEMD_SOURCE = https://github.com/systemd/systemd/raw/master/hwdb.d


version     = $(shell echo `date +%Y%m%d`)
pkgname     = hwids
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source files =======\n"
	@mkdir src
	@( cd src ; \
	   wget -N https://pci-ids.ucw.cz/v2.2/pci.ids             ; \
	   wget -N http://www.linux-usb.org/usb.ids                ; \
	   wget -N -O ma-large.txt http://standards-oui.ieee.org/oui/oui.txt     ; \
	   wget -N -O ma-medium.txt http://standards-oui.ieee.org/oui28/mam.txt  ; \
	   wget -N -O ma-small.txt http://standards-oui.ieee.org/oui36/oui36.txt ; \
	   wget -N http://standards-oui.ieee.org/cid/cid.txt       ; \
	   wget -N http://standards-oui.ieee.org/ethertype/eth.txt ; \
	   wget -N http://standards-oui.ieee.org/manid/manid.txt   ; \
	   wget -N http://standards-oui.ieee.org/bopid/opid.txt    ; \
	   wget -N http://standards-oui.ieee.org/iab/iab.txt       ; \
	   wget -N $(SYSTEMD_SOURCE)/sdio.ids                      ; \
	   tar cJvf ../$(tarball) $(DATA_FILES-yes) ; \
	 )
	@rm -rf src

$(sha1s): $(tarball)
	@echo -e "\n======= Calculation the '$(tarball)' sha1sum =======\n"
	@sha1sum --binary $(tarball) > $(tarball).sha1sum ; \

downloads_clean:
	@rm -rf $(pkgname)-*$(suffix) $(pkgname)-*$(suffix).sha1sum
