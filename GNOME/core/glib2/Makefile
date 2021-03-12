#
# Project Home:
# ============
# http://www.gtk.org
# http://www.gnome.org
#
# Repository browse: https://git.gnome.org/browse/glib
#
# API changes/compatibility report for the glib library:
# -----------------------------------------------------
# http://upstream-tracker.org/versions/glib.html
#
# Downloads:
# =========
# ftp://ftp.gnome.org/pub/GNOME/sources
# https://download.gnome.org/sources
#


url        = https://download.gnome.org/sources

versions   = 2.39.3 2.39.4 2.40.0 2.43.0 2.48.0 2.59.0
versions  += 2.63.0 2.66.7 2.67.6
pkg_name   = glib
arch_type  = tar.xz
suffixes   = $(arch_type)

files      = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))

tarballs   = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s)


.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading '$(pkg_name)' sourses =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.0-9][0-9]*\)\([\.].*\)/\1/'` ; \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name)/$$major_minor/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	  if [ "$$version" = "2.59.0" ] ; then \
	    tar xJf $(pkg_name)-$$version.$$suffix ; \
	    ( cd $(pkg_name)-$$version ; \
	      sed -i 's,gtkdocize |,gtkdocize --copy |,' autogen.sh ; \
	      ./autogen.sh ; \
	      make distclean ; \
	      rm -rf autom4te.cache ) ; \
	    tar cJf $(pkg_name)-$$version.$$suffix $(pkg_name)-$$version ; \
	    rm -rf $(pkg_name)-$$version ; \
	  fi ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s)
