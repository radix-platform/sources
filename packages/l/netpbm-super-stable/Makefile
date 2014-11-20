#
# Project Home:
# ============
# http://netpbm.sourceforge.net
#
# Downloads:
# =========
# http://netpbm.sourceforge.net/getting_netpbm.php
# http://downloads.sourceforge.net/project/netpbm/super_stable/${VERSION}
#

url         = http://downloads.sourceforge.net/project/netpbm/super_stable

versions    = 10.35.93 10.35.94
pkgname     = netpbm
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(\.tar\.gz\)/\2/'` ; \
	  wget -N $(url)/$$version/$(pkgname)-$$version.tgz ; \
	  tar xzf $(pkgname)-$$version.tgz ; \
	  tar czf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
