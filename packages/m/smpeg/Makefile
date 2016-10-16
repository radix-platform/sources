#
# Project Home:
# ============
# http://icculus.org/smpeg
#
# Source tree:
# ===========
# http://svn.icculus.org/smpeg
#
# CHECKOUT:
# ========
# svn checkout svn://svn.icculus.org/smpeg/tags/release_2_0_0
#

url         = svn://svn.icculus.org/smpeg/tags

pkgname     = smpeg

#
# List of revisions to be extracted:
# =================================
#
revisions  = release_0_4_5
revisions += release_2_0_0


versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2,3,4 -d '_' | sed 's,_,\.,g'))

suffix     = tar.gz
tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


all:  $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@for tag in $(revisions) ; do \
	   version=`echo $$tag | cut -f 2,3,4 -d '_' | sed 's,_,\.,g'` ; \
	   if [ ! -f $(pkgname)-$$ver.$(suffix) ]; then \
	     echo -e "\n======= Creating '$(pkgname)-$$version.$(suffix)' snapshot =======" ; \
	     svn co $(url)/$$tag $(pkgname)-$$version ; \
	     ( cd $(pkgname)-$$version ; \
	       ./autogen.sh ; \
	       rm -rf autom4te.cache .svn .cvsignore .gitignore ) ; \
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
