#
# Project Home:
# ============
# http://gstreamer.com
# http://gstreamer.freedesktop.org
#
# Downloads:
# =========
# http://gstreamer.freedesktop.org/src
# http://gstreamer.freedesktop.org/src/gst-plugins-base
#

url         = http://gstreamer.freedesktop.org/src/gst-plugins-base

versions    = 0.10.36 1.4.5 1.6.4 1.7.1 1.8.2
pkgname     = gst-plugins-base
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
