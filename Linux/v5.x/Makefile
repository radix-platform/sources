#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x|5.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x|5.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v5.x

versions    = 5.4.1

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
