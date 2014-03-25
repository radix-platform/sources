#
# Project Home:
# ============
# http://linux-diag.sourceforge.net/Sysfsutils.html
#
# Downloads:
# =========
# http://jfs.sourceforge.net/project/pub
#

url         = http://downloads.sourceforge.net/linux-diag/files

versions    = 2.1.0
pkg_name    = sysfsutils
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-z0-9A-Z-]*\)\([0-9][.0-9][0-9][.0-9]*\)\([\.].*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
