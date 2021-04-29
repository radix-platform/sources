#
# Project Home:
# ============
# http://www.freedesktop.org/wiki/Software/DBusBindings
#
# NOTE:
# ====
# This is deprecated library. New GLib applications should use the D-Bus
# support built into GLib. See glib/gio library.
#
# Downloads:
# =========
# http://dbus.freedesktop.org/releases/dbus-glib
#

url         = https://dbus.freedesktop.org/releases/dbus-glib

versions    = 0.100.2 0.102 0.106 0.110 0.112
pkgname     = dbus-glib
suffix      = tar.gz
sign_suffix = asc

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
