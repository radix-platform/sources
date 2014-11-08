#
# Project Home:
# ============
# http://www.slctech.org/~mackay/NETWATCH/netwatch.html
#
# Downloads:
# =========
# http://www.slctech.org/~mackay/NETWATCH/netwatch-1.3.0-1.tgz
#

url          = http://www.slctech.org/~mackay/NETWATCH

versions     = 1.3.0
pkgname      = netwatch
suffix       = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version-1.tgz ; \
	  tar xzf $(pkgname)-$$version-1.tgz ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version-1.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
