#
# Project Home:
# ============
# http://www.in-ulm.de/~mascheck/various/ash
#
# Downloads:
# =========
# http://mirrors.slackware.com/slackware/slackware_source/ap/ash
#

url         = http://mirrors.slackware.com/slackware/slackware_source/ap/ash

version     = 0.4.0
pkgname     = ash
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@wget -N $(url)/$(tarball)

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
