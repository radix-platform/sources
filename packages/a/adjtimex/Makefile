#
# Project Home:
# ============
# (none)
#
# Downloads:
# =========
# http://www.ibiblio.org/pub/Linux/system/admin/time
#

url         = http://www.ibiblio.org/pub/Linux/system/admin/time

versions    = 1.28
pkg_name    = adjtimex
suffix      = tar.gz

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
