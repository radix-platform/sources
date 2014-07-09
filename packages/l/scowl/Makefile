#
# Project Home:
# ============
# http://wordlist.aspell.net
# http://sourceforge.net/projects/wordlist
#
# Downloads:
# =========
# http://sourceforge.net/projects/wordlist/files/SCOWL
#

url         = http://downloads.sourceforge.net/project/wordlist/SCOWL

versions    = 5 6 7.0 7.1
pkgname     = scowl
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  version=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\(.*\)\(.$(suffix)\)/\2/'` ; \
	  if [ "$$version" == "7.0" ] ; then \
	    version=7 ; \
	  fi ; \
	  wget -N $(url)/Rev\ $$version/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
