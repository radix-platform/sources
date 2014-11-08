#
# Downloads:
# =========
# ftp://ftp.netbsd.org/pub/pkgsrc/distfiles
#

url          = ftp://ftp.netbsd.org/pub/pkgsrc/distfiles

versions     = 2.5.8
pkgname      = elm
suffix       = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)$$version.$(suffix) ; \
	  tar xzf $(pkgname)$$version.$(suffix) ; \
	  mv $(pkgname)$$version $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
