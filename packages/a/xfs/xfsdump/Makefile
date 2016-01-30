#
# Project Home:
# ============
# http://oss.sgi.com/projects/xfs/
#
# Downloads:
# =========
# http://xfs.org/index.php/Getting_the_latest_source_code
# ftp://oss.sgi.com/projects/xfs/cmd_tars/
#

url         = ftp://oss.sgi.com/projects/xfs/cmd_tars

versions    = 3.1.2 3.1.3 3.1.6
pkgname     = xfsdump
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
