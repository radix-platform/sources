#
# Project Home:
# ============
# http://www.oasis-open.org/docbook
# http://www.docbook.org
#
# Downloads:
# =========
# http://www.docbook.org/xml/${VERSION}
#

url         = http://www.docbook.org/xml

versions    = 4.5 4.4 4.3 4.2 4.1.2
pkgname     = docbook-xml
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9][.0-9][.0-9]*\)\(.tar.bz2\)/\2/'` ; \
	  if [ "$$version" == "4.1.2" ] ; then \
	    wget -N $(url)/$$version/docbkx412.zip ; \
	    mkdir $(pkgname)-$$version ; \
	    cp docbkx412.zip $(pkgname)-$$version ; \
	    ( cd $(pkgname)-$$version ; \
	      unzip docbkx412.zip ; \
	      rm docbkx412.zip ) ; \
	    rm docbkx412.zip ; \
	    tar cjf $$tarball $(pkgname)-$$version ; \
	    rm -rf $(pkgname)-$$version ; \
	  else \
	    wget -N $(url)/$$version/$(pkgname)-$$version.zip ; \
	    mkdir $(pkgname)-$$version ; \
	    cp $(pkgname)-$$version.zip $(pkgname)-$$version ; \
	    ( cd $(pkgname)-$$version ; \
	      unzip $(pkgname)-$$version.zip ; \
	      rm $(pkgname)-$$version.zip ) ; \
	    rm $(pkgname)-$$version.zip ; \
	    tar cjf $$tarball $(pkgname)-$$version ; \
	    rm -rf $(pkgname)-$$version ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
