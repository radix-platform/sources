#
# Project Home:
# ============
# http://linux-pam.org
#
# Downloads:
# =========
# https://fedorahosted.org/releases/l/i/linux-pam
#

url          = https://fedorahosted.org/releases/l/i/linux-pam

versions     = 1.1.7 1.1.8
pkg_name     = Linux-PAM
suffix       = tar.bz2

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
doc_tarballs = $(addsuffix -docs.$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(doc_tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(doc_tarballs):
	@echo -e "\n======= Downloading documentation tarballs =======\n"
	@for tarball in $(doc_tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(doc_tarballs) $(sha1s)
