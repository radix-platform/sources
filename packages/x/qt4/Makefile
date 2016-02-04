#
# Project Home:
# ============
# http://qt-project.org
#
# Downloads:
# =========
# http://download.qt-project.org/official_releases/qt
#

url         = http://download.qt-project.org/official_releases/qt

versions    = 4.8.6 4.8.7
pkgname     = qt-everywhere-opensource-src
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  major=`echo $$version | cut -f 1,2 -d '.'` ; \
	  wget -N $(url)/$$major/$$version/$(pkgname)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
