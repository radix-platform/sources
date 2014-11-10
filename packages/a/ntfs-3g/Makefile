#
# Project Home:
# ============
# http://www.tuxera.com/community/ntfs-3g-download
# http://www.tuxera.com/community/release-history
#
# Downloads:
# =========
# http://tuxera.com/opensource/ntfs-3g_ntfsprogs-2013.1.13.tgz
# http://tuxera.com/opensource/ntfs-3g_ntfsprogs-2014.2.15.tgz
#

url         = http://tuxera.com/opensource

versions    = 2013.1.13 2014.2.15
pkg_name    = ntfs-3g_ntfsprogs
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
