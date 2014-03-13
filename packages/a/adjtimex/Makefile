#
# Project Home:
# ============
# http://www.ibiblio.org/pub/Linux/system/admin/time/
#
# Downloads:
# =========
# ftp://ftp.debian.org/debian/pool/main/a/adjtimex/
#

url         = ftp://ftp.debian.org/debian/pool/main/a/adjtimex

version     = 1.29
pkgname     = adjtimex
suffix      = orig.tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -2.2.diff.gz, $(addprefix $(pkgname)_, $(version)))
description = $(addsuffix -2.2.dsc, $(addprefix $(pkgname)_, $(version)))

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
