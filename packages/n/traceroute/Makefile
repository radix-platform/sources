#
# Project Home:
# ============
# http://sourceforge.net/projects/traceroute
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/traceroute/traceroute/traceroute-${VERSION}
#

url         = http://downloads.sourceforge.net/project/traceroute/traceroute

versions    = 2.0.19 2.0.20 2.0.21
pkg_name    = traceroute
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/traceroute-$$version/$(pkg_name)-$$version.$(suffix) ;  \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
