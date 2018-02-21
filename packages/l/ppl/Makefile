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

versions    = 1.0 1.1 1.2

tarballs    = $(addsuffix .tar.xz, $(addprefix ppl-, $(versions)))
tarballs   += $(addsuffix .tar.bz2, $(addprefix ppl-, $(versions)))

sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.tar.*\)/\2/'` ; \
	  wget -N $(url)/$$version/$$tarball ; \
	done

$(filter %.tar.xz.sha1sum,$(sha1s)): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(filter %.tar.bz2.sha1sum,$(sha1s)): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
