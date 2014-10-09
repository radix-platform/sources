#
# Project Home:
# ============
# http://www.json.org
# https://github.com/json-c/json-c/wiki
# https://github.com/json-c/json-c
#
# Releases:
# https://github.com/json-c/json-c/releases
#
# Downloads:
# =========
# https://github.com/json-c/json-c/archive
#

url         = https://github.com/json-c/json-c/archive

versions    = 0.11-20130402 0.12-20140410
pkgname     = json-c
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

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
