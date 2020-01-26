#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x|4.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v4.x

versions    = 4.1.15 4.1.18
versions   += 4.4.3 4.4.71 4.4.205 4.4.211
versions   += 4.9.20 4.9.31 4.9.35 4.9.205 4.9.211
versions   += 4.11.4 4.11.8
versions   += 4.14.23 4.14.26 4.14.82 4.14.157 4.14.167
versions   += 4.19.3 4.19.87 4.19.98

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
