#
# Project Home:
# ============
# http://mama.indstate.edu/users/ice/tree
#
# Downloads:
# =========
# ftp://mama.indstate.edu/linux/tree
# http://mama.indstate.edu/users/ice/tree/src
#

url         = http://mama.indstate.edu/users/ice/tree/src

versions    = 1.6.0 1.7.0
pkg_name    = tree
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkg_name)-$$version.tgz ; \
	  tar xzf $(pkg_name)-$$version.tgz ; \
	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version $(pkg_name)-$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
