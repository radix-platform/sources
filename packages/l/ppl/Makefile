#
# Project Home:
# ============
# http://bugseng.com/products/ppl/
#
# Downloads:
# =========
# ftp://ftp.cs.unipr.it/pub/ppl/releases/
#

url         = ftp://ftp.cs.unipr.it/pub/ppl/releases

versions    = 1.0 1.1

tarballs    = $(addsuffix .tar.bz2, $(addprefix ppl-, $(versions)))
signatures  = $(addsuffix .sign, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.bz2\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(signatures): %.tar.bz2.sign : %.tar.bz2
	@for signature in $@ ; do \
	  version=`echo $$signature | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.bz2.sign\)/\2/'` ; \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$version/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
