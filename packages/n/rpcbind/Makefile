#
# Read First:
# ==========
# https://nfsv4.bullopensource.org/doc/tirpc_rpcbind.php
#
# Project Home:
# ============
# https://rpcbind.sourceforge.net
#
# Downloads:
# =========
# https://downloads.sourceforge.net/sourceforge/rpcbind
#

url         = https://downloads.sourceforge.net/sourceforge/rpcbind

versions    = 0.2.0 0.2.1 0.2.3 1.2.5
pkg_name    = rpcbind
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
