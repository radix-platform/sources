#
# Project Home:
# ============
# http://www.gnome.org
#
# Repository browse: https://git.gnome.org/browse/glib-networking
#
# Downloads:
# =========
# ftp://ftp.gnome.org/pub/GNOME/sources
# https://download.gnome.org/sources
#


url       = https://download.gnome.org/sources

versions  = 2.42.0 2.42.1 2.43.1 2.66.0
pkg_name  = glib-networking
arch_type = tar.xz
suffixes  = $(arch_type)

files     = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))

tarballs  = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s     = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s)


.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading '$(pkg_name)' sourses =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.0-9][0-9]*\)\([\.].*\)/\1/'` ; \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name)/$$major_minor/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s)
