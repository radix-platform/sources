#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v2.6

versions    = 2.6.36 2.6.39.4

tarballs    = $(addsuffix .tar.bz2, $(addprefix linux-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
