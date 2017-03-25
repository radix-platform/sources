#
# Project Home:
# ============
# http://judy.sourceforge.net
# http://judy.sourceforge.net/doc/Judy_3x.htm
#
# Downloads:
# =========
# http://downloads.sourceforge.net/judy
#

url         = http://downloads.sourceforge.net/judy

versions    = 1.0.5
pkgname     = judy
tgzname     = Judy
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9][.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$(tgzname)-$$version.$(suffix) ; \
	  tar xzf $(tgzname)-$$version.$(suffix) ; \
	  ( cd $(pkgname)-$$version ; \
	    rm -rf autom4te.cache ; \
	  ) ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(tgzname)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
