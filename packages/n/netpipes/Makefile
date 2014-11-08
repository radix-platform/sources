#
# Project Home:
# ============
# http://freecode.com/projects/netpipes
# http://web.purplefrog.com/~thoth/netpipes
#
# Downloads:
# =========
# http://web.purplefrog.com/~thoth/netpipes/ftp
#

url          = http://web.purplefrog.com/~thoth/netpipes/ftp

versions     = 4.2
pkgname      = netpipes
suffix       = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version-export.$(suffix) ; \
	  tar xzf $(pkgname)-$$version-export.$(suffix) ; \
	  mv $(pkgname)-$$version-export $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version-export.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
