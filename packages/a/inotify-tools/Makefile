#
# Project Home:
# ============
# http://inotify-tools.sourceforge.net
# https://github.com/rvoicilas/inotify-tools/wiki
#
# Downloads:
# =========
# http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-3.14.tar.gz
#

url         = http://github.com/downloads/rvoicilas/inotify-tools

versions    = 3.14
pkg_name    = inotify-tools
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkg_name)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
