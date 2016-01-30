#
# Project Home:
# ============
# http://www.rodsbooks.com/gdisk
# http://sourceforge.net/projects/gptfdisk
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/${VERSION}
#

url         = http://downloads.sourceforge.net/project/gptfdisk/gptfdisk

versions    = 0.8.7 0.8.10 1.0.0 1.0.1
pkgname     = gptfdisk
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
