#
# Project Home:
# ============
# https://www.openhub.net/p/libutempter
# Freecode: http://freecode.com/projects/libutempter
#
# Git:
# ===
# git: git://git.altlinux.org/people/ldv/packages/libutempter.git
#
# GitWeb:
# ======
# gitweb: http://git.altlinux.org/people/ldv/packages/?p=libutempter.git
#
# Downloads:
# =========
# ftp://ftp.altlinux.org/pub/people/ldv/utempter
#

url         = ftp://ftp.altlinux.org/pub/people/ldv/utempter

versions    = 1.1.5 1.1.6
pkg_name    = libutempter
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
