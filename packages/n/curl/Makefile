#
# Project Home:
# ============
# http://curl.haxx.se
#
# Downloads:
# =========
# http://curl.haxx.se/download.html
#
# cacert download:
# ===============
# http://curl.haxx.se/docs/caextract.html
#

url         = http://curl.haxx.se/download
cacert_url  = http://curl.haxx.se/ca

versions    = 7.31.0 7.36.0
pkgname     = curl
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .asc, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))
cacert      = cacert.pem.bz2

all: $(tarballs) $(signatures) $(sha1s) $(cacert)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).sig : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(cacert):
	@echo -e "\n======= Downloading $(cacert) tarball =======\n"
	@wget -N $(cacert_url)/cacert.pem ; bzip2 -9 cacert.pem ; rm -f cacert.pem

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s) $(cacert)
