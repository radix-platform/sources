#
# Project Home:
# ============
# http://www-archive.mozilla.org/projects/firefox/index.html
#
# Downloads:
# =========
# http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/$(VERSION)/
#

url         = http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases

versions    = 44.0
pkgname     = mozilla-certs
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	   version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*[.0-9]*\)\([\.].*\)/\2/'` ; \
	   wget -N $(url)/$$version/source/firefox-$$version.source.$(suffix)  ; \
	   tar -xJvf firefox-$$version.source.$(suffix) \
	     firefox-$$version/security/nss/lib/ckfw/builtins/certdata.txt  \
	     firefox-$$version/security/nss/lib/ckfw/builtins/nssckbi.h   ; \
	   rm -f firefox-$$version.source.$(suffix)                       ; \
	   ( cd firefox-$$version/security/nss/lib/ckfw/builtins ; \
	     mv certdata.txt nssckbi.h ../../../../..            ; \
	     cd ../../../../..                                   ; \
	     rm -rf security                                     ; \
	   ) ; \
	   mv firefox-$$version $(pkgname)-$$version ; \
	   tar cJvf $$tarball $(pkgname)-$$version ; \
	   rm -rf $(pkgname)-$$version ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
