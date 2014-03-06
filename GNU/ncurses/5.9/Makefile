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

url         = ftp://invisible-island.net/ncurses

version     = 5.9
pkgname     = ncurses
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

dates       = 20130504
patches     = $(addsuffix .sh.gz, $(addprefix patch-$(version)-, $(dates)))


all: $(tarballs) $(sha1s) $(patches)

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

$(patches):
	@echo -e "\n======= Downloading patches for $(pkgname)-$(version) =======\n"
	@for patch in $(patches) ; do \
	  wget -N $(url)/$(version)/$$patch ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s) $(patches)
