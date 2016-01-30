#
# Project Home:
# ============
# http://www.draisberghof.de/usb_modeswitch
#
# Downloads:
# =========
# http://www.draisberghof.de/usb_modeswitch/#download
# http://www.draisberghof.de/usb_modeswitch
#

url         = http://www.draisberghof.de/usb_modeswitch

versions    = 2.2.0 2.3.0
pkg_name    = usb-modeswitch
suffix      = tar.bz2

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
