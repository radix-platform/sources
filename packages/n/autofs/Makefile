#
# Project Home:
# ============
# http://freecode.com/projects/autofs
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/daemons/autofs/v5
#


url       = ftp://ftp.kernel.org/pub/linux/daemons

versions  = 5.0.7 5.1.0 5.1.1
pkg_name  = autofs
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
	  major_minor=`echo $$version | sed 's/\([0-9]*\)\([\.].*\)/\1/'` ; \
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
