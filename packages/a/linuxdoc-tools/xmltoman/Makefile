#
# Project Home:
# ============
# http://sourceforge.net/projects/xmltoman
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/xmltoman/xmltoman/xmltoman-0.4.tar.gz/ - this is directory at sf.
#

url         = http://downloads.sourceforge.net/project/xmltoman/xmltoman/xmltoman-0.4.tar.gz

versions    = 0.4
pkgname     = xmltoman
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
