#
# Project Home:
# ============
# http://libpipeline.nongnu.org
# http://savannah.nongnu.org/projects/libpipeline
#
# Downloads:
# =========
# http://download.savannah.gnu.org/releases/libpipeline
#

url         = http://download.savannah.gnu.org/releases/libpipeline

versions    = 1.3.1 1.4.0 1.4.1
pkgname     = libpipeline
suffix      = tar.gz

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
