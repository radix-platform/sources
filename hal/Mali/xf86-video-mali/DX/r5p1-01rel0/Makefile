#
# Project Home:
# ============
# http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads/drivers/DX910
#

url         = http://malideveloper.arm.com/downloads/drivers/DX910

src_pkgname = DX910-SW-99003
src_release = r5p1-01rel0
src_version = 0.0.1
src_suffix  = tgz

version     = 0.4.2
pkgname     = xf86-video-mali
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))


all: $(tarball) $(sha1s)

.PHONY: downloads_clean

$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	@( wget -N $(url)/$(src_release)/$(src_pkgname)-$(src_release).$(src_suffix) ; \
	   mkdir .build $(pkgname)-$(version) ; \
	   tar xzf $(src_pkgname)-$(src_release).$(src_suffix) -C .build ; \
	   cp -r .build/x11/$(pkgname)-$(src_version)/* $(pkgname)-$(version) ; \
	   ( cd $(pkgname)-$(version) ; \
	     chmod 0755 sconscript src/sconscript ; \
	     autoreconf -i ; \
	     rm -rf autom4te.cache ; \
	   ) ; \
	   ( cd $(pkgname)-$(version)/src ; \
	     wget -N http://cgit.freedesktop.org/~cooperyuan/compat-api/plain/compat-api.h ; \
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
