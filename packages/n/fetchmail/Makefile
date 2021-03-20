#
# Project Home:
# ============
# http://www.fetchmail.info
# http://sourceforge.net/projects/fetchmail
#
# Downloads:
# =========
# http://downloads.sourceforge.net/fetchmail
#

url         = https://downloads.sourceforge.net/fetchmail

versions    = 6.4.1 6.4.17
pkg_name    = fetchmail
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  major_minor=`echo $$version | sed 's/\([0-9][.][0-9]*\)\([\.].*\)/\1/'` ; \
	  wget -N $(url)/branch_$${major_minor}/$(pkg_name)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
