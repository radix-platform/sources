#
# Project Home:
# ============
# http://nc110.sourceforge.net
#
# Downloads:
# =========
# http://coast.cs.purdue.edu/pub/tools/unix/netutils/netcat
#

url         = http://coast.cs.purdue.edu/pub/tools/unix/netutils/netcat

versions    = 1.10
pkgname     = netcat
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  vers=`echo $$version | sed 's/\.//g'` ; \
	  wget -N $(url)/nc$$vers.tgz ; \
	  mkdir $(pkgname)-$$version ; \
	  tar xf nc$$vers.tgz -C $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version nc$$vers.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
