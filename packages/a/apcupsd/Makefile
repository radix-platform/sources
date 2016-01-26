#
# Project Home:
# ============
# http://www.apcupsd.org
# http://apcupsd.sourceforge.net
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/apcupsd/apcupsd - Stable/${VERSION}
#

url         = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable

versions    = 3.14.12 3.14.13
pkg_name    = apcupsd
arch_type   = tar.gz
suffixes    = $(arch_type) $(arch_type).sig

files       = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))
tarballs    = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s)

.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$$version/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(files) $(sha1s)
