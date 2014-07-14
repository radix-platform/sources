#
# Thorsten Kukuk:
# ==============
# https://build.opensuse.org/user/show/kukuk
#
# pam-modules:
# ===========
# https://build.opensuse.org/package/show/Linux-PAM/pam-modules
#
# Downloads:
# =========
# https://build.opensuse.org/source/Linux-PAM/pam-modules
#

url         = https://build.opensuse.org/source/Linux-PAM/pam-modules

versions    = 2.9.1
pkg_name    = pam_unix2
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

patch_names = glibc216 selinux
patches     = $(addsuffix .patch, $(addprefix $(pkg_name)-, $(patch_names)))
patches_gz  = $(addsuffix .gz, $(patches))


all: $(tarballs) $(patches_gz) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(patches_gz):
	@echo -e "\n======= Downloading documentation tarballs =======\n"
	@for patch in $(patches) ; do \
	  wget -N $(url)/$$patch ; \
	  gzip -9 $$patch ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(patches_gz) $(sha1s)
