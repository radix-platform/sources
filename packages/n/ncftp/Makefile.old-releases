#
# Project Home:
# ============
# http://www.ncftp.com
# http://www.ncftp.com/ncftp
#
# Downloads:
# =========
# http://www.ncftp.com/download
# ftp://ftp.ncftp.com/ncftp
#

url         = ftp://ftp.ncftp.com/ncftp

versions    = 3.2.5
pkg_name    = ncftp
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkg_name)-$$version-src.$(suffix) ; \
	  tar xjf $(pkg_name)-$$version-src.$(suffix) ; \
	  tar cjf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version $(pkg_name)-$$version-src.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
