#
# Project Home:
# ============
# http://sourceforge.net/projects/infozip
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/infozip/Zip 3.x (latest)/3.0/
#

url         = http://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/

versions    = 30
pkgname     = zip
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
