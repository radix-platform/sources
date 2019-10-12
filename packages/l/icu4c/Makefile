#
# Project Home:
# ============
# http://site.icu-project.org
#
# ICU Documentation:
# =================
# http://icu-project.org/apiref/icu4c
#
# Downloads:
# =========
# http://site.icu-project.org/download
#
# http://downloads.sourceforge.net/project/icu/ICU4C/${VERSION}
#

url         = http://downloads.sourceforge.net/project/icu/ICU4C

versions    = 54.1 55.1 56.1 65.1
pkgname     = icu4c
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  v=`echo $$version | sed 's/\./_/g'` ; \
	  wget -N $(url)/$$version/$(pkgname)-$$v-src.tgz ; \
	  tar xzf $(pkgname)-$$v-src.tgz ; \
	  mv icu $(pkgname)-$$version ; \
	  tar cjf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$v-src.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
