#
# Project Home:
# ============
# http://trn.sourceforge.net
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/traceroute/traceroute/traceroute-${VERSION}
#

url         = http://downloads.sourceforge.net/project/trn/trn4

versions    = 4.0-test77
pkg_name    = trn
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
