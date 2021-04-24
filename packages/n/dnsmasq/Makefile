#
# Project Home:
# ============
# http://www.thekelleys.org.uk/dnsmasq/doc.html
#
# Downloads:
# =========
# https://www.thekelleys.org.uk/dnsmasq
#

url         = https://www.thekelleys.org.uk/dnsmasq

versions    = 2.80 2.84 2.85
pkgname     = dnsmasq
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
