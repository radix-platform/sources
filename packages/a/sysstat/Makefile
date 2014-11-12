#
# Project Home:
# ============
# http://sebastien.godard.pagesperso-orange.fr
#
# Downloads:
# =========
# http://sebastien.godard.pagesperso-orange.fr/download.html
# http://pagesperso-orange.fr/sebastien.godard
#

url         = http://pagesperso-orange.fr/sebastien.godard

versions    = 11.0.2 11.1.2
pkg_name    = sysstat
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
