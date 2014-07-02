#
# Project Home:
# ============
# http://sourceforge.net/projects/cracklib
#
# Downloads:
# =========
# http://sourceforge.net/projects/cracklib/files/cracklib-words
#
# NOTE:
# ====
#   There are additional word lists available for download, e.g.,
#   from http://www.cotse.com/tools/wordlists.htm. CrackLib can
#   utilize as many, or as few word lists you choose to install.
#

url         = http://sourceforge.net/projects/cracklib/files/cracklib-words

versions    = 20080507
pkgname     = cracklib-words
suffix      = gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  directory=`echo $$tarball | sed 's/\([a-zA-Z-]*\)\([0-9]*\)\([\.].*\)/\2/'` ; \
	  year=`echo $$directory | cut -c1-4`  ; \
	  month=`echo $$directory | cut -c5-6` ; \
	  day=`echo $$directory | cut -c7-8`   ; \
	  wget -N $(url)/$$year-$$month-$$day/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
