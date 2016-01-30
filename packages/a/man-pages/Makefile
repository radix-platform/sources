#
# Project Home:
# ============
# https://www.kernel.org/doc/man-pages
#
# Git:
# ===
# http://git.kernel.org/cgit/docs/man-pages/man-pages.git
# git clone http://git.kernel.org/pub/scm/docs/man-pages/man-pages
#
# Downloads:
# =========
# https://www.kernel.org/pub/linux/docs/man-pages/Archive
#


url       = https://www.kernel.org/pub/linux/docs/man-pages/Archive

versions  = 3.75 3.83 4.04
pkg_name  = man-pages
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
