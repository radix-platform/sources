#
# Project Home:
# ============
# https://i2c.wiki.kernel.org/index.php/I2C_Tools
#
# Git:
# ===
# https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
#
# Downloads:
# =========
# https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools
#

url         = https://www.kernel.org/pub/software/utils/i2c-tools

versions    = 3.1.0 3.1.1 4.2
pkgname     = i2c-tools
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
