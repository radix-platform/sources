#
# url = http://www.kernel.org/pub/linux/kernel/[v2.6|3.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/[v2.6|3.x]
#

url_prefix     = http://www.kernel.org/pub/linux/kernel
url_v2_6       = v2.6
url_v3_x       = v3.x

tarballs_2_6   = linux-2.6.36.tar.bz2      linux-2.6.39.4.tar.bz2
signatures_2_6 = linux-2.6.36.tar.bz2.sign linux-2.6.39.4.tar.bz2.sign

tarballs_3_x   = linux-3.5.4.tar.bz2  linux-3.8.5.tar.bz2
signatures_3_x = linux-3.5.4.tar.sign linux-3.8.5.tar.sign


TARGETS  = $(tarballs_2_6) $(signatures_2_6)
TARGETS += $(tarballs_3_x) $(signatures_3_x)

all: $(TARGETS)

.PHONY: downloads_clean

#
# v2.6
#
$(tarballs_2_6):
	@echo -e "\n======= Downloading source tarballs ======="
	@for tarball in $(tarballs_2_6) ; do \
	  wget -N $(url_prefix)/$(url_v2_6)/$$tarball ; \
	done

$(signatures_2_6):
	@echo -e "\n======= Downloading tarball signatures ======="
	@for signature in $(signatures_2_6) ; do \
	  wget -N $(url_prefix)/$(url_v2_6)/$$signature ; \
	done

#
# v3.x
#
$(tarballs_3_x):
	@echo -e "\n======= Downloading source tarballs ======="
	@for tarball in $(tarballs_3_x) ; do \
	  wget -N $(url_prefix)/$(url_v3_x)/$$tarball ; \
	done

$(signatures_3_x):
	@echo -e "\n======= Downloading tarball signatures ======="
	@for signature in $(signatures_3_x) ; do \
	  wget -N $(url_prefix)/$(url_v3_x)/$$signature ; \
	done

downloads_clean:
	@rm -rf $(TARGETS)
