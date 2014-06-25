#
# Project Home:
# ============
# http://www2m.biglobe.ne.jp/~dolphin/lha/lha-unix.htm
#
# Downloads:
# =========
# ftp://ftp.debian.org/debian/pool/non-free/l/lha
#

url         = ftp://ftp.debian.org/debian/pool/non-free/l/lha

version     = 1.14i
pkgname     = lha
suffix      = orig.tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -10.3.diff.gz, $(addprefix $(pkgname)_, $(version)))
description = $(addsuffix -10.3.dsc, $(addprefix $(pkgname)_, $(version)))

files       = $(patch) $(description)

all: $(tarball) $(files) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	wget -N $(url)/$(tarball)

$(files): $(tarball)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(files) $(sha1s)
