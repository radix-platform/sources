#
# Project Home:
# ============
# https://reiser4.wiki.kernel.org/index.php/Main_Page
#
# Downloads:
# =========
# ftp://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs
#

url         = ftp://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs

versions    = 3.6.23 3.6.24
pkgname     = reiserfsprogs
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][0-9][.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/v$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
