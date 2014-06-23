#
# Project Home:
# ============
# http://www2m.biglobe.ne.jp/~dolphin/lha/lha-unix.htm
#
# Downloads:
# =========
# http://www2m.biglobe.ne.jp/~dolphin/lha/lha-download.htm
#

url         = http://www2m.biglobe.ne.jp/~dolphin/lha/prog

versions    = 114h 114i
pkgname     = lha
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
