#
# Project Home:
# ============
# http://web.mit.edu/kerberos
#
# Downloads:
# =========
# http://web.mit.edu/kerberos/dist
#

url         = http://web.mit.edu/kerberos/dist/krb5


versions    = 1.12.5 1.13.3 1.14 1.17 1.19.1
pkgname     = krb5
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Getting '$(pkgname)' sourses =======\n"
	@for tarball in $(tarballs) ; do \
	  major_minor=`echo $$tarball | sed 's/\([a-zA-Z0-9-]*\)\([0-9]\.[0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$${major_minor}/$$tarball ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done
	@rm -f $(signed_tarballs)

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
