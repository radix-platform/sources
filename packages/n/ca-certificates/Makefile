#
# Project Home:
# ============
# https://packages.debian.org/ru/sid/ca-certificates
#
# Downloads:
# =========
# ftp://ftp.de.debian.org/debian/pool/main/c/ca-certificates
#

url         = ftp://ftp.de.debian.org/debian/pool/main/c/ca-certificates

version     = 20140325
pkgname     = ca-certificates
suffix      = tar.xz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
description = $(addsuffix .dsc, $(addprefix $(pkgname)_, $(version)))

files       = $(description)

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
