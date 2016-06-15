#
# Project Home:
# ============
# http://www.boost.org
# http://www.boost.org/users/history/version_1_57_0.html
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/boost/boost
#

url         = http://downloads.sourceforge.net/project/boost/boost

versions    = 1.57.0 1.58.0 1.59.0 1.60.0 1.61.0
pkgname     = boost
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.bz2\)/\2/'` ; \
	  archdir=$(pkgname)_`echo $$version | sed 's,\.,_,g'` ; \
	  archive=$$archdir.$(suffix) ; \
	  wget -N $(url)/$$version/$$archive ; \
	  tar xjf $$archive ; \
	  rm -f $$archive ; \
	  mv $$archdir $(pkgname)-$$version ; \
	  tar cjf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
