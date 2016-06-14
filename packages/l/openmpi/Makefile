#
# Project Home:
# ============
# http://www.open-mpi.org
#
# Downloads:
# =========
# http://www.open-mpi.org/software/ompi/v${MAJOR_MINOR}/downloads
#

url         = http://www.open-mpi.org/software/ompi

versions    = 1.8.4 1.8.8 1.10.2
pkgname     = openmpi
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.0-9][0-9]*\)\([\.].*\)/\1/'` ; \
	  wget -N $(url)/v$$major_minor/downloads/$(pkgname)-$$version.$(suffix) ;  \
	done


$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
