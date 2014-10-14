#
# Project Home:
# ============
# http://libusb.org
# http://sourceforge.net/projects/libusb
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1
#

url         = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1

versions    = 0.1.4 0.1.5
pkgname     = libusb-compat
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.bz2\)/\2/'` ; \
	  wget -N $(url)/$(pkgname)-$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
