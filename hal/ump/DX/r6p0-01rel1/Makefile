#
# Project Home:
# ============
# http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-ump-user-space-drivers-source-code-2
#
# Downloads:
# =========
# http://malideveloper.arm.com/downloads/drivers/DX910
#

url         = http://malideveloper.arm.com/downloads/drivers/DX910

src_pkgname = DX910-SW-99006
src_release = r6p0-01rel1
src_suffix  = tgz

version     = 6.0.1.1
pkgname     = libump
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
	   cp -r .build/$(src_pkgname)-$(src_release)/driver/src/ump/* $(pkgname)-$(version) ; \
	   mkdir $(pkgname)-$(version)/src ; \
	   cp -a $(pkgname)-$(version)/arch_011_udd/*.{c,h} $(pkgname)-$(version)/src ; \
	   cp -a $(pkgname)-$(version)/os/*.h $(pkgname)-$(version)/src ; \
	   cp -a $(pkgname)-$(version)/os/linux/*.{c,h} $(pkgname)-$(version)/src ; \
	   rm -rf $(pkgname)-$(version)/arch_011_udd $(pkgname)-$(version)/os ; \
	   ( cd $(pkgname)-$(version) ; \
	     chmod 0644 src/*.h src/*.c include/ump/*.h ; \
	   ) ; \
	   ( cd $(pkgname)-$(version)/src ; \
	     chmod 0644 *.h *.c ; \
	     sed -i 's,\.\./os/,,' ump_arch.c ; \
	     sed -i 's,\.\./,,' ump_uku.c ; \
	     sed -i 's,ump_uk_types\.h,ump/ump_uk_types\.h,' ump_ioctl.h ; \
	   ) ; \
	   rm -f $(pkgname)-$(version)/Makefile ; \
	   rm -f $(pkgname)-$(version)/readme.txt ; \
	   rm -f $(pkgname)-$(version)/ump.mak ; \
	   cp -r config/* $(pkgname)-$(version) ; \
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
