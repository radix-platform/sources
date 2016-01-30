#
# Project Home:
# ============
# https://packages.debian.org/sid/os-prober
#
# Downloads:
# =========
# http://ftp.de.debian.org/debian/pool/main/o/os-prober
#

url         = http://ftp.de.debian.org/debian/pool/main/o/os-prober

versions    = 1.65 1.70
pkgname     = os-prober
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
description = $(addsuffix .dsc, $(addprefix $(pkgname)-, $(versions)))

files       = $(description)

all: $(tarball) $(files) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)_$$version.$(suffix) ; \
	  tar xJf $(pkgname)_$$version.$(suffix) ; \
	  mv $(pkgname) $(pkgname)-$$version ; \
	  tar cJf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)_$$version.$(suffix) ; \
	done

$(files): $(tarball)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)_$$version.dsc ; \
	  mv $(pkgname)_$$version.dsc $(pkgname)-$$version.dsc ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(files) $(sha1s)
