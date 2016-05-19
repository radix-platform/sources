#
# Project Home:
# ============
# http://netpbm.sourceforge.net
#
# Downloads:
# =========
# http://netpbm.sourceforge.net/getting_netpbm.php
#
# Source tree:
# ===========
# http://sourceforge.net/p/netpbm/code/HEAD/tree
#

url         = http://svn.code.sf.net/p/netpbm/code

pkgname     = netpbm

branch      = advanced
#
# List of revisions to be extracted:
# =================================
#
# Revisions from 'advanced' branch.
#
#       revision | version
#      ----------+---------
revisions  = 2294-10.68.00
revisions += 2298-10.68.01
revisions += 2678-10.73.00
revisions += 2772-10.74.03


versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))

suffix     = tar.bz2
tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


all:  $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@for revision in $(revisions) ; do \
	   rev=`echo $$revision | cut -f 1 -d '-'` ; \
	   ver=`echo $$revision | cut -f 2 -d '-'` ; \
	   if [ ! -f $(pkgname)-$$ver.tar.bz2 ]; then \
	     echo -e "\n======= Creating '$(pkgname)-$$ver.$(suffix)' snapshot =======" ; \
	     svn -r$$rev co $(url)/$(branch) $(pkgname)-$$ver ; \
	     ( cd $(pkgname)-$$ver ; rm -rf .svn ) ; \
	     tar cjvf $(pkgname)-$$ver.$(suffix) $(pkgname)-$$ver ; \
	     rm -rf $(pkgname)-$$ver ; \
	   fi ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
