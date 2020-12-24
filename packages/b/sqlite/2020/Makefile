#
# Project Home:
# ============
# http://www.sqlite.org
#
# Downloads:
# =========
# http://www.sqlite.org/download.html
# http://www.sqlite.org/2014/sqlite-autoconf-3080701.tar.gz
#
# tarball, version encoding:
# =========================
# tarball: sqlite-product-version.tar.gz
# version: 3.X.Y -> 3XXYY00; 3.X.Y.Z -> 3XXYYZZ
#

url         = http://www.sqlite.org/2020

versions    = 3.31.1.0 3.34.0.0
pkgname     = sqlite
product     = autoconf
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  m=`echo $$version | cut -f1 -d'.'` ; \
	  x=`echo $$version | cut -f2 -d'.'` ; \
	  y=`echo $$version | cut -f3 -d'.'` ; \
	  z=`echo $$version | cut -f4 -d'.'` ; \
	  vcode=`printf "%d%0.2d%0.2d%0.2d" $$m $$x $$y $$z` ; \
	  wget -N $(url)/$(pkgname)-$(product)-$$vcode.$(suffix) ; \
	  tar xzf $(pkgname)-$(product)-$$vcode.$(suffix) ; \
	  mv $(pkgname)-$(product)-$$vcode $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)-$(product)-$$vcode.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
