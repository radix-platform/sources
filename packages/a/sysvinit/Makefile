#
# Project Home:
# ============
# http://savannah.nongnu.org/projects/sysvinit
#
# Downloads:
# =========
# http://download.savannah.nongnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2
#

url         = http://download.savannah.nongnu.org/releases/sysvinit

versions    = 2.90 2.95 2.96 2.97 2.98 2.99
pkgname     = sysvinit
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
