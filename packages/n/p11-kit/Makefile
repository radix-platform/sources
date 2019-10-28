#
# Project Home:
# ============
# https://p11-glue.github.io/p11-glue/p11-kit.html
#
# Downloads:
# =========
# https://github.com/p11-glue/p11-kit/releases
#

url         = https://github.com/p11-glue/p11-kit/releases/download

versions    = 0.23.18 0.23.18.1
pkgname     = p11-kit
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\($(pkgname)-\)\(.*\)\(.$(suffix)\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
