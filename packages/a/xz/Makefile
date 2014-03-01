#
# Project Home:
# ============
# http://tukaani.org/xz/
#
# Downloads:
# =========
# http://tukaani.org/xz/xz-5.0.5.tar.gz
#

url         = http://tukaani.org/xz/

versions    = 5.0.5
pkg_name    = xz
tar_suffix  = .tar.bz2

tarballs    = $(addsuffix $(tar_suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %$(tar_suffix).sha1sum : %$(tar_suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
