#
# Project Home:
# ============
# http://sourceforge.net/projects/linuxconsole/
#
# Downloads:
# =========
# http://downloads.sourceforge.net/linuxconsole/files/
#

url         = http://downloads.sourceforge.net/linuxconsole/files

versions    = 1.4.6 1.4.7 1.4.8 1.4.9 1.7.0
pkg_name    = linuxconsoletools
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
