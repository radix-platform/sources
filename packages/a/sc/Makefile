#
# Project Home:
# ============
# [ http://www.ibiblio.org/pub/Linux/apps/financial/spreadsheet ]
#
# Downloads:
# =========
# http://www.ibiblio.org/pub/Linux/apps/financial/spreadsheet
#

url         = http://www.ibiblio.org/pub/Linux/apps/financial/spreadsheet

versions    = 7.16
pkgname     = sc
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))
description = $(addsuffix .lsm, $(addprefix $(pkgname)-, $(versions)))

files       = $(description)


all: $(tarballs) $(files) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(files): $(tarballs)
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
	@rm -rf $(tarballs) $(files) $(sha1s)
