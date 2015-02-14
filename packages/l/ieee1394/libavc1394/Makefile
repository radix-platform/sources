#
# Project Home:
# ============
# http://www.linux1394.org
# http://sourceforge.net/projects/libavc1394
#
# Downloads:
# =========
# http://downloads.sourceforge.net/project/libavc1394/libavc1394/${VERSION}/libavc1394-${VERSION}.tar.gz
# http://downloads.sourceforge.net/project/libavc1394/libavc1394/libavc1394-0.5.4.tar.gz
#

url         = http://downloads.sourceforge.net/project/libavc1394/libavc1394


versions    = 0.5.4
pkgname     = libavc1394
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

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
