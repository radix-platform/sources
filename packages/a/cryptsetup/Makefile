#
# Project Home:
# ============
# https://code.google.com/p/cryptsetup
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/utils/cryptsetup
# https://www.kernel.org/pub/linux/utils/cryptsetup
#


url       = https://www.kernel.org/pub/linux/utils

versions  = 1.4.3 1.6.6 1.7.0 2.3.5
pkg_name  = cryptsetup
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
	  major_minor=`echo $$version | sed 's/\([0-9][.][0-9]*\)\([\.].*\)/\1/'` ; \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name)/v$$major_minor/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s)
