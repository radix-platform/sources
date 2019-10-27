#
# Project Home:
# ============
# http://www.gnu.org/software/ddrescue
#
# Downloads:
# =========
# http://ftp.gnu.org/gnu/ddrescue
#

url         = http://ftp.gnu.org/gnu/ddrescue

versions    = 1.17 1.18.1 1.19 1.24
pkgname     = ddrescue
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)-$$version.tar.lz ; \
	  lzip -d $(pkgname)-$$version.tar.lz ; \
	  gzip $(pkgname)-$$version.tar ; \
	  rm -f $(pkgname)-$$version.tar.lz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
