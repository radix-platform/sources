#
# Project Home:
# ============
# https://tracker.debian.org/pkg/at
#
# Git:
# ===
# git clone https://anonscm.debian.org/git/collab-maint/at.git
# git clone git://anonscm.debian.org/collab-maint/at.git
#
# Downloads:
# =========
# http://cdn.debian.net/debian/pool/main/a/at
#

url         = http://cdn.debian.net/debian/pool/main/a/at

versions    = 3.1.12 3.1.13 3.1.16
pkgname     = at
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)_$$version.orig.tar.gz ; \
	  tar xzf $(pkgname)_$$version.orig.tar.gz ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)_$$version.orig.tar.gz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
