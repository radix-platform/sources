#
# Project Home:
# ============
#   http://www.kernel.org
#
# Downloads:
# =========
#   ftp://metalab.unc.edu/pub/Linux/hardware
#   ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
#   ftp://ftp.kernel.org/pub/software/utils/pciutils
#

url         = ftp://ftp.kernel.org/pub/software/utils/pciutils

versions    = 3.2.0 3.2.1
pkgname     = pciutils
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
