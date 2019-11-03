#
# Project Home:
# ============
# http://www.ibiblio.org/pub/packages/solaris/sparc/html/metamail.2.7.html
#
# Downloads:
# =========
# http://ftp.funet.fi/pub/unix/mail/metamail
#

url         = http://ftp.funet.fi/pub/unix/mail/metamail

versions    = 2.7
pkgname     = metamail
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/mm$$version.tar.Z ; \
	  uncompress -c mm$$version.tar.Z | tar xf - ; \
	  chmod a-x mm$$version/src/metamail/*.c ; \
	  ( cd mm$$version ; \
	    mv src $(pkgname)-$$version ; \
	    tar czf ../$(pkgname)-$$version.$(suffix) $(pkgname)-$$version ) ; \
	  rm -rf mm$$version mm$$version.tar.Z ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
