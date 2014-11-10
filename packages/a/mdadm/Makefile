#
# Project Home:
# ============
# http://neil.brown.name/blog/mdadm
#
# GitWeb:
# ======
# http://git.neil.brown.name
# http://git.neil.brown.name/?p=mdadm.git;a=summary
# git://neil.brown.name/mdadm
#
# Downloads:
# =========
# https://www.kernel.org/pub/linux/utils/raid/mdadm
# ftp://ftp.kernel.org/pub/linux/utils/raid/mdadm
#


url       = ftp://ftp.kernel.org/pub/linux/utils/raid/mdadm

versions  = 3.2.6 3.3.2
pkg_name  = mdadm
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
