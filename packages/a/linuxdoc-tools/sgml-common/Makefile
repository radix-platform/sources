#
# Project Home:
# ============
# http://www.docbook.org/xml
# http://www.linuxfromscratch.org/blfs/view/svn/pst/sgml-common.html
#
# Downloads:
# =========
# ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES
#

url         = ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES

versions    = 0.6.3
pkgname     = sgml-common
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tgz ; \
	  tar xzf $(pkgname)-$$version.tgz ; \
	  tar cjf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
