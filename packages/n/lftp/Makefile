#
# Project Home:
# ============
# 
#
# Downloads:
# =========
# ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp
#
# MIRRORS:
# ftp://ftp.st.ryukoku.ac.jp/pub/network/ftp/lftp   Japan
# ftp://ftp.tuwien.ac.at/infosys/browsers/ftp/lftp  Austria
# ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp        Berlin, Germany
# http://lftp.cybermirror.org                       Karlsruhe, Germany
#

url         = ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp

versions    = 4.4.9 4.4.14 4.4.15
pkgname     = lftp
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
