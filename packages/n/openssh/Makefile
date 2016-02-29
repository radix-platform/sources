#
# Project Home:
# ============
# http://www.openssh.com
# http://www.openssh.com/portable.html - mirrors list
#
# Downloads:
# =========
# ftp://ftp.openssh.com/pub/OpenBSD/OpenSSH/portable
#

url         = ftp://ftp.openssh.com/pub/OpenBSD/OpenSSH/portable

versions    = 6.3p1 6.4p1 6.5p1 6.6p1 6.9p1 7.1p2 7.2p1
pkgname     = openssh
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .asc, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


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
