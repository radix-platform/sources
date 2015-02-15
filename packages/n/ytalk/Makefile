#
# Project Note:
# ============
# http://directory.fsf.org/wiki/Ytalk
#
# Downloads:
# =========
# ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/ytalk-3.3.0.tar.gz
#

url         = ftp://ftp.netbsd.org/pub/pkgsrc/distfiles

versions    = 3.3.0
pkgname     = ytalk
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
