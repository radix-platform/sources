#
# Project Home:
# ============
# https://www.sourceware.org/lvm2
#
# Downloads:
# =========
# ftp://sources.redhat.com/pub/lvm2
#
# Mirrors list:
# ============
# https://sourceware.org/mirrors.html
#

url         = http://ftp.gwdg.de/pub/linux/sources.redhat.com/lvm2

versions    = 2.02.186 2.03.06 2.03.11
pkg_name    = LVM2
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkg_name).$$version.tgz ; \
	  tar xzf $(pkg_name).$$version.tgz ; \
	  mv $(pkg_name).$$version $(pkg_name)-$$version ; \
	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version $(pkg_name).$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
