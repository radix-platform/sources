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

versions    = 2.10.6
pkgname     = soma
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
