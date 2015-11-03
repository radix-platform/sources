#
# Project Home:
# ============
# http://elinux.org/CI20-SGX_kernel_module
#
# Downloads:
# =========
# $ wget http://mipscreator.imgtec.com/CI20/sgx/SGX_DDK_Linux_XOrg_MAIN%403759903_source_km.tgz
#

url         = ftp://radix.pro/3pp/Imagination/ci20/sgx-km/1.14

versions    = 1.14.3759903
pkgname     = ci20-sgx-km
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
