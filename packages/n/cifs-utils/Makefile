#
# Project Home:
# ============
# http://wiki.samba.org/index.php/LinuxCIFS_utils
#
# Downloads:
# =========
# ftp://ftp.samba.org/pub/linux-cifs/cifs-utils
#


url       = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils

versions  = 5.5 6.4
pkg_name  = cifs-utils
arch_type = tar.bz2
suffixes  = $(arch_type) $(arch_type).asc

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
