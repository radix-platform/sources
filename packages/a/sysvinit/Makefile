#
# Project Home:
# ============
# http://savannah.nongnu.org/projects/sysvinit
#
# Downloads:
# =========
# http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2
#

url         = http://download.savannah.gnu.org/releases/sysvinit

versions    = 2.88dsf
pkgname     = sysvinit
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