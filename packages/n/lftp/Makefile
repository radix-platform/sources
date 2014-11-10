#
# Project Home:
# ============
# http://lftp.yar.ru
#
# Downloads:
# =========
# http://lftp.yar.ru/ftp
#
# Old versions (4.4.9 4.4.14 4.4.15) Downloads:
# ============================================
# ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp
#
# MIRRORS:
# ftp://ftp.st.ryukoku.ac.jp/pub/network/ftp/lftp   Japan
# ftp://ftp.tuwien.ac.at/infosys/browsers/ftp/lftp  Austria
# ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp        Berlin, Germany
# http://lftp.cybermirror.org                       Karlsruhe, Germany
#

url         = http://lftp.yar.ru/ftp

versions    = 4.5.6 4.6.0
pkgname     = lftp
suffix      = tar.xz

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

$(signatures): %.$(suffix).sig : %.$(suffix)
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
