#
# Project Home:
# ============
# http://openvpn.net
#
# Downloads:
# =========
# http://openvpn.net/index.php/open-source/downloads.html
# http://swupdate.openvpn.org/community/releases
#

url          = http://swupdate.openvpn.org/community/releases

versions     = 2.3.5
pkgname      = openvpn
suffix       = tar.xz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures   = $(addsuffix .asc, $(tarballs))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).asc : %.$(suffix)
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
