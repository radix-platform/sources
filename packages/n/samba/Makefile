#
# Project Home:
# ============
# http://www.samba.org
#
# Downloads:
# =========
# ftp://ftp.samba.org/pub/samba/stable
# https://download.samba.org/pub/samba/stable
#

url         = https://download.samba.org/pub/samba/stable

versions    = 4.1.0 4.1.12 4.1.13 4.3.4 4.11.2
pkg_name    = samba
arch_type   = tar.gz
suffixes    = $(arch_type) tar.asc

files       = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))
tarballs    = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


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
