#
# Project Home:
# ============
# http://www.dawoodfall.net/slackbuilds/noversion/soma
#
# Downloads:
# =========
# http://www.dawoodfall.net/files/slackbuilds/noversion/soma/soma-2.9.1.tar.gz
#

url         = http://www.dawoodfall.net/files/slackbuilds/noversion/soma

version     = 2.9.1
pkgname     = soma
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	wget -N $(url)/$(tarball)

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
