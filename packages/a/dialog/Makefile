#
# Project Home:
# ============
# http://invisible-island.net/dialog
#
# Downloads:
# =========
# ftp://invisible-island.net/dialog
# https://invisible-mirror.net/archives/dialog
#

url          = ftp://ftp.invisible-island.net/dialog

versions     = 1.1-20120215 1.1-20120706 1.2-20140112 1.2-20140219 1.2-20150920
versions    += 1.3-20170131 1.3-20170509 1.3-20181107 1.3-20190211 1.3-20190808
versions    += 1.3-20201126 1.3-20210117 1.3-20210621
suffix       = tgz

tarballs     = $(addsuffix .$(suffix), $(addprefix dialog-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))


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
