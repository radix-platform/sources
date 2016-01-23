#
# Project Home:
# ============
# http://roy.marples.name/blog
# http://roy.marples.name/blog/categories/5-dhcpcd
#
# Downloads:
# =========
# http://roy.marples.name/downloads/dhcpcd
#

url          = http://roy.marples.name/downloads/dhcpcd

old_versions = 6.0.5 6.4.2
old_suffix   = tar.bz2

new_versions = 6.10.1
new_suffix   = tar.xz

pkgname      = dhcpcd

old_tarballs = $(addsuffix .$(old_suffix), $(addprefix $(pkgname)-, $(old_versions)))
old_sha1s    = $(addsuffix .sha1sum, $(old_tarballs))

new_tarballs = $(addsuffix .$(new_suffix), $(addprefix $(pkgname)-, $(new_versions)))
new_sha1s    = $(addsuffix .sha1sum, $(new_tarballs))

tarballs     = $(new_tarballs) $(old_tarballs)

all: $(tarballs) $(new_sha1s) $(old_sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(new_sha1s): %.$(new_suffix).sha1sum : %.$(new_suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(old_sha1s): %.$(old_suffix).sha1sum : %.$(old_suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(new_sha1s) $(old_sha1s)
