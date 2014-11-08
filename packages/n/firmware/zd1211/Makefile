#
# Project Home:
# ============
# http://sourceforge.net/projects/zd1211
#
# Info:
# ====
# http://wireless.kernel.org/en/users/Drivers/zd1211rw
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/zd1211/zd1211-firmware/${VERSION}
#

url         = http://downloads.sourceforge.net/project/zd1211/zd1211-firmware

versions    = 1.4 1.5
pkgname     = zd1211-firmware
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkgname)-$$version.$(suffix) ; \
	  tar xjf $(pkgname)-$$version.$(suffix) ; \
	  rm -f $(pkgname)-$$version.$(suffix) ; \
	  mv $(pkgname) $(pkgname)-$$version ; \
	  tar cjf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
