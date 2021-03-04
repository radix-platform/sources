#
# Project Home:
# ============
# http://psmisc.sourceforge.net/
# http://sourceforge.net/projects/psmisc/files/psmisc/
#
# Downloads:
# =========
# http://downloads.sourceforge.net/psmisc/files
#

url         = http://downloads.sourceforge.net/psmisc/files

versions    = 23.2 23.3 23.4
pkgname     = psmisc
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
