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

url         = http://ibiblio.org/pub/linux/system/hardware

version     = 1.27
pkgname     = isapnptools
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@wget -N $(url)/$(pkgname)-$(version).tgz
	@tar xzf $(pkgname)-$(version).tgz
	@tar cjf $(tarball) $(pkgname)-$(version)
	@rm -rf $(pkgname)-$(version)
	@rm -f $(pkgname)-$(version).tgz

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
