#
# Project Home:
# ============
# https://www.isc.org/downloads/dhcp
#
# Downloads:
# =========
# ftp://ftp.isc.org/isc/dhcp/$(VERSION)
#

url         = ftp://ftp.isc.org/isc/dhcp

versions    = 4.2.5-P1 4.3.1
pkgname     = dhcp
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkgname)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
