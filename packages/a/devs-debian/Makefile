#
# Project Home:
# ============
# http://www.ibiblio.org/pub/Linux/system/admin
#
# Downloads:
# =========
# ftp://ftp.debian.org/debian/pool/main/m/makedev
# http://cdn.debian.net/debian/pool/main/m/makedev
#

url         = http://cdn.debian.net/debian/pool/main/m/makedev

version     = 2.3.1
pkgname     = makedev
suffix      = orig.tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -93.diff.gz, $(addprefix $(pkgname)_, $(version)))
description = $(addsuffix -93.dsc, $(addprefix $(pkgname)_, $(version)))

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
