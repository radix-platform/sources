#
# Project Home:
# ============
# http://www.oasis-open.org/docbook
# http://www.docbook.org
#
# Downloads:
# =========
# http://www.docbook.org/xml/${VERSION}
#

url         = http://www.docbook.org/xml

versions    = 5.0 5.0.1 5.1
pkgname     = docbook
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*\)\(.tar.bz2\)/\2/'` ; \
	  wget -N $(url)/$$version/$(pkgname)-$$version.zip ; \
	  unzip $(pkgname)-$$version.zip ; \
	  tar cjf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.zip ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
