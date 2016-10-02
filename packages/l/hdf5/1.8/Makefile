#
# Project Home:
# ============
# https://support.hdfgroup.org/HDF5
#
# Downloads:
# =========
# https://support.hdfgroup.org/ftp/HDF5/releases
#
# Full Path:
# =========
# https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${SHORT_VERSION}/hdf5-${VERSION}${PATCH}/src/hdf5-${VERSION}${PATCH}.tar.bz2
#

url         = https://support.hdfgroup.org/ftp/HDF5/releases

versions    = 1.8.17
pkgname     = hdf5
suffix      = tar.bz2

short_versions = $(foreach ver, $(versions), $(shell echo $(ver) | cut -f1,2 -d'.'))
full_versions  = $(foreach ver, $(versions), $(shell echo $(ver) | cut -f1,2 -d'.'))

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs |$(tarballs)|=======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9]*\)\([-]\)\([0-9]*[\.0-9]*\)\([\.].*\)/\3/'` ; \
	  wget -N $(url)/$(pkgname)-$${version}/src/$(pkgname)-$${version}.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
