#
# Project Home:
# ============
# http://www.rpm.org
#
# Downloads:
# =========
# http://www.rpm.org/wiki/Download
# http://rpm.org/releases/rpm-${MAJOR.MINOR}.x
#

url         = http://rpm.org/releases

versions    = 4.10.0 4.10.3.1 4.11.2
pkgname     = rpm
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  major_minor_x=`echo $$version | cut -f1,2 -d'.'`.x ; \
	  wget -N $(url)/$(pkgname)-$$major_minor_x/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
