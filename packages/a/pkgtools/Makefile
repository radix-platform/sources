#
# Project Home:
# ============
# https://radix.pro/build-system/pkgtool
#
# Subversion:
# ==========
# https://csvn.radix.pro/pkgtools
#
# Downloads:
# =========
# https://ftp.radix.pro/pub/pkgtools
#

url        = svn://radix.pro/pkgtools/tags

pkg_name   = pkgtools

versions   = 0.1.5 0.1.6 0.1.7 0.1.8

svn_repo   = .svn_clone
tarballs   = $(addsuffix .tar.xz, $(addprefix $(pkg_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = $(sha1s)

all: $(TARGETS)

.PHONY: downloads_clean

$(tarballs):
	@for version in $(versions) ; do \
	  tag=$(pkg_name)-`echo $$version` ; \
	  rm -rf ./$${tag} ; \
	  svn checkout $(url)/$${tag} ; \
	  rm -rf $${tag}/.svn ; \
	  tar cJvf $${tag}.tar.xz $${tag} ; \
	  rm -rf $${tag} ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
