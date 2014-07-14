#
# Project Home:
# ============
# http://web.mit.edu/kerberos
#
# Downloads:
# =========
# http://web.mit.edu/kerberos/dist
#

url         = http://web.mit.edu/kerberos/dist

versions    = 1.11.5 1.12.1
pkgname     = krb5
suffix      = tar.gz

sign_suffix     = signed.tar
signed_tarballs = $(addsuffix -$(sign_suffix), $(addprefix $(pkgname)-, $(versions)))

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .asc, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(signed_tarballs) $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(signed_tarballs):
	@echo -e "\n======= Downloading '$(pkgname)' signed sourses =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.0-9][0-9]*\)\([\.].*\)/\1/'` ; \
	  wget -N $(url)/$(pkgname)/$$major_minor/$(pkgname)-$$version-$(sign_suffix) ;  \
	done

$(tarballs): %.$(suffix) : %-$(sign_suffix)
	@echo -e "\n======= Getting '$(pkgname)' sourses =======\n"
	@for tarball in $< ; do \
	   tar xvf $$tarball ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done
	@rm -f $(signed_tarballs)

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
