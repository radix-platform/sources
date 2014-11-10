#
# Project Home:
# ============
# http://www.ibiblio.org/pub/Linux/system/backup
#
# Downloads:
# =========
# http://www.ibiblio.org/pub/Linux/system/backup
#

url         = http://www.ibiblio.org/pub/Linux/system/backup

version     = 1.1
pkgname     = mt-st
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
description = $(addsuffix .lsm, $(addprefix $(pkgname)-, $(version)))

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
