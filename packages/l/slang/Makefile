#
# Project Home:
# ============
# http://jedsoft.org/slang/index.html
#
# Downloads:
# =========
# ftp://space.mit.edu/pub/davis/slang
#

url         = ftp://space.mit.edu/pub/davis/slang

versions    = 2.2.4
pkgname     = slang
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.0-9][0-9]*\)\([\.].*\)/\1/'` ; \
	  wget -N $(url)/v$$major_minor/$(pkgname)-$$version.$(suffix) ;  \
	done


$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
