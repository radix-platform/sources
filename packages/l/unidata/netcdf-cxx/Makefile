#
# Project Home:
# ============
# http://www.unidata.ucar.edu
#
# GitHub:
# ======
# https://github.com/Unidata/netcdf-cxx4
#
# Downloads:
# =========
# http://www.unidata.ucar.edu/downloads/netcdf/netcdf-cxx/index.jsp
# ftp://ftp.unidata.ucar.edu/pub/netcdf
#

url         = ftp://ftp.unidata.ucar.edu/pub/netcdf

versions    = 4.2 4.3.0
pkgname     = netcdf-cxx4
suffix      = tar.gz

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
