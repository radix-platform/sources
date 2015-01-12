#
# Project Home:
# ============
# http://www.open-mpi.org/projects/hwloc
#
# Downloads:
# =========
# http://www.open-mpi.org/software/hwloc/v${MAJOR_MINOR}/downloads
#

url         = http://www.open-mpi.org/software/hwloc

versions    = 1.10.0 1.10.1rc1
pkgname     = hwloc
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
