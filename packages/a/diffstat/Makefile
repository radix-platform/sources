#
# Project Home:
# ============
# http://invisible-island.net/diffstat
#
# Downloads:
# =========
# http://invisible-island.net/diffstat/#download
# ftp://invisible-island.net/diffstat
# http://invisible-island.net/datafiles/release
#

url         = ftp://ftp.invisible-island.net/diffstat

versions    = 1.53 1.59 1.61 1.64
pkgname     = diffstat
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tgz ; \
	  tar xzf $(pkgname)-$$version.tgz ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
