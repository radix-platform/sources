#
# Project Home:
# ============
# http://www.tcsh.org/Home
#
# Downloads:
# =========
# http://www.tcsh.org/MostRecentRelease
#
# ftp://ftp.astron.com/pub/tcsh            [US]
# ftp://ftp.gw.com/pub/unix/tcsh           [Finland]
# ftp://ftp.funet.fi/pub/unix/shells/tcsh  [Finland]
#

url         = ftp://ftp.funet.fi/pub/unix/shells/tcsh

versions    = 6.18.01
pkg_name    = tcsh
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkg_name)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
