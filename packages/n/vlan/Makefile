#
# Project Home:
# ============
# http://www.candelatech.com/~greear/vlan.html
#
# Downloads:
# =========
# http://www.candelatech.com/~greear/vlan/vlan.1.9.tar.gz
#
# Downloads from fossies.org because it is old project:
# ====================================================
# http://fossies.org/linux/misc/old/vlan.1.9.tar.xz
#

url         = http://fossies.org/linux/misc/old

versions    = 1.9
pkgname     = vlan
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname).$$version.$(suffix) ; \
	  tar xJf $(pkgname).$$version.$(suffix) ; \
	  rm -f $(pkgname).$$version.$(suffix) ; \
	  mv $(pkgname) $(pkgname)-$$version ; \
	  tar cJf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
