#
# Project Home:
# ============
# http://slackware.com
#
# Downloads:
# =========
# http://mirrors.slackware.com/slackware/slackware-14.1/source/a/eject
#

url         = http://mirrors.slackware.com/slackware/slackware-14.1/source/a/eject

version     = 2.1.5
pkgname     = eject
suffix      = tar.bz2

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@wget -N $(url)/$(tarball)
	@tar xjf $(tarball)
	@mv $(pkgname) $(pkgname)-$(version)
	@rm -f $(tarball)
	@tar cjf $(tarball) $(pkgname)-$(version)
	@rm -rf $(pkgname)-$(version)

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
