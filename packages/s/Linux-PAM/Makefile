#
# Project Home:
# ============
# http://linux-pam.org
#
# Downloads:
# =========
# https://github.com/linux-pam/linux-pam/releases
#

url          = https://github.com/linux-pam/linux-pam/releases

versions     = 1.5.0 1.5.1
pkg_name     = Linux-PAM
suffix       = tar.xz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
doc_tarballs = $(addsuffix -docs.$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))
sha1s       += $(addsuffix .sha1sum, $(doc_tarballs))


all: $(tarballs) $(doc_tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/download/v$$version/$$tarball ; \
	done

$(doc_tarballs):
	@echo -e "\n======= Downloading documentation tarballs =======\n"
	@for tarball in $(doc_tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9][.0-9]*[.0-9]*\)\(\-.*\)/\2/'` ; \
	  wget -N $(url)/download/v$$version//$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(doc_tarballs) $(sha1s)
