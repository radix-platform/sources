#
# Project Home:
# ============
# http://sourceforge.net/projects/infozip
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/infozip/UnZip 6.x (latest)/UnZip 6.0/
#

url         = http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/

versions    = 60
pkgname     = unzip
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname), $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
