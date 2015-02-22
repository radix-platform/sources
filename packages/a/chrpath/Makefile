#
# Project Home:
# ============
# https://alioth.debian.org/projects/chrpath
#
# Downloads:
# =========
# https://alioth.debian.org/frs/?group_id=31052
#
# Source tree:
# ===========
# https://alioth.debian.org/scm/viewvc.php/?root=chrpath
#
# CHECKOUT:
# ========
# svn checkout svn://scm.alioth.debian.org/svn/chrpath/trunk
#

url         = svn://scm.alioth.debian.org/svn/chrpath/tags

pkgname     = chrpath

#
# List of revisions to be extracted:
# =================================
#
revisions  = RELEASE_0_15
revisions += RELEASE_0_16


versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2,3 -d '_' | sed 's,_,\.,g'))

suffix     = tar.gz
tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


all:  $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@for branch in $(revisions) ; do \
	   version=`echo $$branch | cut -f 2,3 -d '_' | sed 's,_,\.,g'` ; \
	   if [ ! -f $(pkgname)-$$ver.$(suffix) ]; then \
	     echo -e "\n======= Creating '$(pkgname)-$$version.$(suffix)' snapshot =======" ; \
	     svn co $(url)/$$branch $(pkgname)-$$version ; \
	     ( cd $(pkgname)-$$version ; \
	       aclocal ; autoheader ; automake -ac ; autoconf ; \
	       rm -rf .svn autom4te.cache ) ; \
	     tar czvf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	     rm -rf $(pkgname)-$$version ; \
	   fi ; \
	 done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
