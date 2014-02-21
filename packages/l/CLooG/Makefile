#
# Project Home:
# ============
# http://bugseng.com/products/ppl/
#
# Downloads:
# =========
# ftp://ftp.cs.unipr.it/pub/ppl/releases/
#

url         = http://www.bastoul.net/cloog/pages/download/

versions    = 0.18.1 0.18.2

tarballs    = $(addsuffix .tar.gz, $(addprefix cloog-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
