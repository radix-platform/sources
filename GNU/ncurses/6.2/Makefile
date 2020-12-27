#
# Project Home:
# ============
# http://www.gnu.org/software/ncurses/
#
# Downloads:
# =========
# ftp://invisible-island.net/ncurses/
# ftp://ftp.gnu.org/pub/gnu/ncurses/
#

url         = https://invisible-mirror.net/archives/ncurses/current

version     = 6.2-20201219
pkgname     = ncurses
suffix      = tgz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
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
