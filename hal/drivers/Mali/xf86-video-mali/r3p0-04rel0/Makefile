#
# Project Home:
# ============
# http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads
#

url         = http://malideveloper.arm.com/downloads

src_pkgname = DX910-SW-99003
src_release = r3p0-04rel0
src_suffix  = tgz

version     = 0.0.1
pkgname     = xf86-video-mali
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@( wget -N $(url)/$(src_pkgname)-$(src_release).$(src_suffix) ; \
	   mkdir .build $(pkgname)-$(version) ; \
	   tar xzf $(src_pkgname)-$(src_release).$(src_suffix) -C .build ; \
	   cp -r .build/$(src_pkgname)-$(src_release)/x11/$(pkgname)-$(version)/* $(pkgname)-$(version) ; \
	   ( cd $(pkgname)-$(version) ; \
	     autoreconf -i ; \
	     rm -rf autom4te.cache ; \
	   ) ; \
	   tar czf $(tarball) $(pkgname)-$(version) ; \
	   rm -rf .build $(src_pkgname)-$(src_release).$(src_suffix) $(pkgname)-$(version) ; \
	 )

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
