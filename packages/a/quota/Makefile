#
# Project Home:
# ============
# http://sourceforge.net/projects/linuxquota
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/linuxquota/quota-tools/${VERSION}
#

url         = http://downloads.sourceforge.net/project/linuxquota/quota-tools

versions    = 3.17 4.01
pkgname     = quota
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	  tar xzf $$tarball ; \
	  mv $(pkgname)-tools $(pkgname)-$$version ; \
	  tar czf $$tarball $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
