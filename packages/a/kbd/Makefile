#
# Project Home:
# ============
# http://www.kbd-project.org
#
# Git:
# ===
# git clone git://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git
# git clone http://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git
#
# Downloads:
# =========
# http://www.kbd-project.org/download
# ftp://ftp.kernel.org/pub/linux/utils/kbd
#

url         = https://www.kernel.org/pub/linux/utils/kbd

versions    = 1.15.3 2.0.2 2.0.3 2.2.0 2.4.0
pkg_name    = kbd
suffix      = tar.xz

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
