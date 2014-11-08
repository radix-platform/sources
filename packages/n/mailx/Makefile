#
# Project Home:
# ============
# http://sourceforge.net/projects/nail
#
# Downloads:
# =========
# http://sourceforge.net/p/nail/code/?source=navbar
# http://nail.cvs.sourceforge.net/viewvc/nail/nail/
#

url         = nail.cvs.sourceforge.net

#         version | revision
#        ---------+----------
versions    = 12.5:1.212
pkgname     = mailx
suffix      = tar.gz

tarballs    = $(foreach version, $(versions), \
                $(addsuffix .$(suffix), \
                  $(addprefix $(pkgname)-, $(shell echo $(version) | cut -f 1 -d ':' )))  )
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  ver=`echo $$version | cut -f 1 -d ':'` ; \
	  rev=`echo $$version | cut -f 2 -d ':'` ; \
	  cvs -z3 -d:pserver:anonymous@$(url):/cvsroot/nail \
	           co -f -r $$rev -d mailx-$$ver nail > /dev/null 2>&1 ; \
	  tar czf mailx-$$ver.$(suffix) mailx-$$ver ; \
	  rm -rf mailx-$$ver ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
