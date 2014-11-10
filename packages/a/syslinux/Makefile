#
# Project Home:
# ============
# http://www.syslinux.org/wiki/index.php/The_Syslinux_Project
#
# GitWeb:
# ======
# http://git.neil.brown.name
# http://git.neil.brown.name/?p=mdadm.git;a=summary
# git://neil.brown.name/mdadm
#
# Downloads:
# =========
# http://www.syslinux.org/wiki/index.php/Download
# https://www.kernel.org/pub/linux/utils/boot/syslinux
# ftp://ftp.kernel.org/pub/linux/utils/boot/syslinux
#


url       = ftp://ftp.kernel.org/pub/linux/utils/boot/syslinux

versions  = 4.06 6.03
pkg_name  = syslinux
arch_type = tar.xz
suffixes  = $(arch_type) tar.sign

files     = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))
tarballs  = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s     = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s)


.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading '$(pkg_name)' sourses =======\n"
	@for version in $(versions) ; do \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s)
