#
# Project Home:
# ============
# https://github.com/vapier/ncompress
#
# Downloads:
# =========
# https://github.com/vapier/ncompress/releases
#

url         = https://github.com/vapier/ncompress/archive

versions    = 4.2.4.6
pkg_name    = ncompress
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/v$$version.$(suffix) ; \
	  mv v$$version.$(suffix) $(pkg_name)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
