#
# Project Home:
# ============
# http://ftp.math.utah.edu/pub/zoo
# http://www.ibiblio.org/pub/Linux/utils/compress
# http://slackware.com
#
# Downloads:
# =========
# http://mirrors.slackware.com/slackware/slackware-14.1/source/a/zoo
#

url         = http://mirrors.slackware.com/slackware/slackware-14.1/source/a/zoo

version     = 2.10-22.debian
pkgname     = zoo
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_,$(version)))
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
