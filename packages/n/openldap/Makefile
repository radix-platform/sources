#
# Project Home:
# ============
# http://www.openldap.org
#
# Downloads:
# =========
# http://www.openldap.org/software/download/
#
# ftp:
# ===============
# ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release
#

url         = ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release

versions    = 2.4.31 2.4.39 2.4.43
pkgname     = openldap
suffix      = tgz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .md5, $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures):
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
