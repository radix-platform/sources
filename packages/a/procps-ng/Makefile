#
# Project Home:
# ============
# https://sourceforge.net/projects/procps-ng
#
# Downloads:
# =========
# https://sourceforge.net/projects/procps-ng/files/Production
# https://gitlab.com/procps-ng/procps
#

url         = https://sourceforge.net/projects/procps-ng/files/Production

versions    = 3.3.15 3.3.16 3.3.17
pkgname     = procps-ng
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
