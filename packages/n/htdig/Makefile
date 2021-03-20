#
# Project Home:
# ============
# https://www.htdig.org
# https://sourceforge.net/projects/htdig
#
# Downloads:
# =========
# https://sourceforge.net/projects/htdig/files/htdig/3.2.0b6
#

url         = https://downloads.sourceforge.net/project/htdig/htdig

versions    = 3.2.0b5 3.2.0b6
pkg_name    = htdig
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkg_name)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
