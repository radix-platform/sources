#
# Downloads:
# =========
# https://download.kde.org/stable/4.14.3/src
#

url         = https://download.kde.org/stable/4.14.3/src

suffix      = tar.xz

tarballs    = $(shell wget -O - $(url)/ 2>/dev/null | grep "href=.*\.tar\.xz<" | sed -e "s,.*>\(.*\.tar\.xz\)<.*,\1,")
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
