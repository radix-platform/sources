#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x|5.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x|5.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v5.x

versions    = 5.4.1 5.4.8 5.4.12 5.4.14 5.4.15 5.4.19 5.4.29 5.4.33 5.4.83
versions   += 5.9.14
versions   += 5.10.11 5.10.27 5.10.34 5.10.37 5.10.69
versions   += 5.14.8 5.14.9

pkgname     = linux
suffix      = tar.xz

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
