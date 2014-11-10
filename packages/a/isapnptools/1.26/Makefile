#
# Project Home:
# ============
# http://ibiblio.org/pub/linux/system/hardware
# http://slackware.com
#
# Downloads:
# =========
# http://ibiblio.org/pub/linux/system/hardware
# http://mirrors.slackware.com/slackware/slackware-14.1/source/a/isapnptools
#

url         = http://mirrors.slackware.com/slackware/slackware-14.1/source/a/isapnptools

version     = 1.26
pkgname     = isapnptools
suffix      = tar.xz

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
