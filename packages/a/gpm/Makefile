#
# Project Home:
# ============
# http://www.nico.schottelius.org/software/gpm/
#
# Downloads:
# =========
# http://www.nico.schottelius.org/software/gpm/archives/
#

url         = http://www.nico.schottelius.org/software/gpm/archives

versions    = 1.20.7
pkg_name    = gpm
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	  version=`echo $$tarball | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  pkg=`echo $$tarball | sed 's/\(^[a-zA-Z]*\)\([-]\)\([0-9][.0-9]*[.0-9]*\)\(.*\)/\1/'` ; \
	  tar xjf $$tarball ; \
	  ( cd $$pkg-$$version ; ./autogen.sh ; rm -rf autom4te.cache ) ; \
	  tar cjf $$pkg-$$version.$(suffix) $$pkg-$$version ; \
	  rm -rf $$pkg-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
