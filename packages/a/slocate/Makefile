#
# Project Home:
# ============
# ... deprecated progect of Kevin Lindsay [ http://slocate.trakker.ca ]
#
# Downloads:
# =========
# Downloads from fossies.org because it is old project:
# ====================================================
# http://fossies.org/linux/misc/old/slocate-3.1.tar.xz
#

url         = http://fossies.org/linux/misc/old

versions    = 3.1
pkgname     = slocate
suffix      = tar.xz

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
