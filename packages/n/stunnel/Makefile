#
# Project Home:
# ============
# https://www.stunnel.org/index.html
#
# Downloads:
# =========
# https://www.stunnel.org/downloads
#
# Code Repositories
# -----------------
#  Europe
#    * usenix.org.uk (London, UK)
#      http://www.usenix.org.uk/mirrors/stunnel/
#    * NLUUG (Amsterdam, Netherlands)
#      ftp://ftp.nluug.nl/pub/networking/stunnel
#      http://ftp.nluug.nl/pub/networking/stunnel/
#      rsync ftp.nluug.nl::stunnel
#    * Names Directory (Bamberg, Germany)
#      http://www.namesdir.com/mirrors/stunnel/
#    * Cybermirror.org (Düsseldorf, Germany)
#      http://stunnel.cybermirror.org/ 
#  North America
#    * Home site (Newark, NJ, US)
#      ftp://ftp.stunnel.org/stunnel/
#      rsync rsync.stunnel.org::stunnel
#    * mirrors.zerg.biz (Columbus, OH, US)
#      http://mirrors.zerg.biz/stunnel/ 
#

url         = ftp://ftp.nluug.nl/pub/networking/stunnel/archive

versions    = 4.53 5.07
pkgname     = stunnel
suffix      = tar.gz
sign_suffix = asc

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  major=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$$major.x/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  major=`echo $$signature | sed 's/\([a-zA-Z-]*\)\([0-9]*\)\(\..*\)/\2/'` ; \
	  wget -N $(url)/$$major.x/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
