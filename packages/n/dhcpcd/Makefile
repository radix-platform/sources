#
# Project Home:
# ============
# http://roy.marples.name/blog
# http://roy.marples.name/blog/categories/5-dhcpcd
#
# Downloads:
# =========
# http://roy.marples.name/downloads/dhcpcd
#

url         = http://roy.marples.name/downloads/dhcpcd

versions    = 6.0.5 6.4.2
pkgname     = dhcpcd
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
