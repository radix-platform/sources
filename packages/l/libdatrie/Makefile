#
# Project Home:
# ============
# http://linux.thai.net/projects/datrie
#
# Downloads:
# =========
# ftp://linux.thai.net/pub/ThaiLinux/software/libthai
# http://linux.thai.net/pub/thailinux/software/libthai
#

url         = http://linux.thai.net/pub/thailinux/software/libthai

versions    = 0.2.8 0.2.10
pkgname     = libdatrie
suffix      = tar.xz

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
