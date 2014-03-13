#
# Project Home:
# ============
# https://packages.debian.org/source/stable/shadow
#
# Downloads:
# =========
# http://ftp.de.debian.org/debian/pool/main/s/shadow
# http://cdn.debian.net/debian/pool/main/s/shadow
#

url         = http://ftp.de.debian.org/debian/pool/main/s/shadow

version     = 4.1.5.1
pkgname     = shadow
suffix      = orig.tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -1.diff.gz, $(addprefix $(pkgname)_, $(version)))
description = $(addsuffix -1.dsc, $(addprefix $(pkgname)_, $(version)))

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
