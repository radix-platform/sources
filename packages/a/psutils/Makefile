#
# Project Home:
# ============
# http://knackered.org/angus/psutils
#
# Downloads:
# =========
# ftp://ftp.knackered.org/pub/psutils
#

url         = ftp://ftp.knackered.org/pub/psutils

versions    = 1.17
pkgname     = psutils
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  v=`echo $$version | sed 's/1\./p/g'` ; \
	  wget -N $(url)/$(pkgname)-$$v.$(suffix) ; \
	  tar xzf $(pkgname)-$$v.$(suffix) ; \
	  mv $(pkgname) $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$v.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
