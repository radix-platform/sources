#
# Project Home:
# ============
# https://fdutils.linux.lu
#
# Downloads:
# =========
# https://fdutils.linux.lu/download.html
#

url         = https://fdutils.linux.lu

version     = 5.5
pkgname     = fdutils
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -20081027.diff.gz, $(addprefix $(pkgname)-, $(version)))
description = $(addsuffix .lsm, $(addprefix $(pkgname)-, $(version)))

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
