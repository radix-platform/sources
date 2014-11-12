#
# Project Home:
# ============
# http://www.linuxfoundation.org/collaborate/workgroups/openprinting
# http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic
#
# Downloads:
# =========
# http://www.openprinting.org/download/foomatic
#

url         = http://www.openprinting.org/download/foomatic

versions    = 4.0.12 4.0.17
pkgname     = foomatic-filters
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-,$(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarball =======\n"
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
