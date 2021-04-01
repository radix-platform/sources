#
# Project Home:
# ============
# https://packages.debian.org/sid/ca-certificates
#
# Downloads:
# =========
# http://deb.debian.org/debian/pool/main/c/ca-certificates
# http://ftp.debian.org/debian/pool/main/c/ca-certificates/
#

url          = http://ftp.debian.org/debian/pool/main/c/ca-certificates

versions     = 20190110 20210119
pkgname      = ca-certificates
suffix       = tar.xz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))
descriptions = $(addsuffix .dsc, $(addprefix $(pkgname)_, $(versions)))

files       = $(descriptions)

all: $(tarballs) $(files) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarball =======\n"
	@for tarball in $(tarballs) ; do \
	   wget -N $(url)/$${tarball} ; \
	   version=`echo $${tarball} | sed 's,$(pkgname)_,,' | sed 's,\.$(suffix),,'` ; \
	   if [ "$${version}" = "20210119" ] ; then \
	     tar xJf $(pkgname)_$${version}.$(suffix) ; \
	     mv work $(pkgname)-$${version} ; \
	     tar cJf $(pkgname)_$${version}.$(suffix) $(pkgname)-$${version} ; \
	     rm -rf $(pkgname)-$${version} ; \
	   fi ; \
	 done

$(files): $(tarballs)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$${file} ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$${tarball}' sha1sum =======\n" ; \
	  sha1sum --binary $${tarball} > $${tarball}.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(files) $(sha1s)
