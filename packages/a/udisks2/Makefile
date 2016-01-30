#
# Project Home:
# ============
# http://www.freedesktop.org/wiki/Software/udisks
#
# Downloads:
# =========
# http://udisks.freedesktop.org/releases
#

url         = http://udisks.freedesktop.org/releases

versions    = 2.1.0 2.1.3 2.1.4 2.1.5 2.1.6
pkg_name    = udisks
suffix      = tar.bz2
sign_suffix = sign

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
