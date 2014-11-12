#
# Project Home:
# ============
# http://xiph.org/paranoia
#
# Downloads:
# =========
# http://xiph.org/downloads
# http://downloads.xiph.org/releases/cdparanoia
#

url         = http://downloads.xiph.org/releases/cdparanoia

versions    = 10.2
pkgname     = cdparanoia-III
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.src.tgz ; \
	  tar xzf $(pkgname)-$$version.src.tgz ; \
	  tar czf $(pkgname)-$$version.tar.gz $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$$version.src.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
