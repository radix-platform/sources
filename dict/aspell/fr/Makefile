#
# Project Home:
# ============
# ftp://ftp.gnu.org/gnu/aspell/dict/0index.html
#
# Downloads:
# =========
# ftp://ftp.gnu.org/gnu/aspell/dict/fr
#

url         = https://ftp.gnu.org/gnu/aspell/dict/fr

versions    = -fr-0.50-3
pkgname     = aspell
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname), $(versions)))
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
