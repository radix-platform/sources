#
# Project Home:
# ============
# [ http://www.emacswiki.org/emacs/Jove ]
#
# Downloads:
# =========
# ftp://ftp.cs.toronto.edu/cs/ftp/pub/hugh/jove-dev
#

url         = ftp://ftp.cs.toronto.edu/cs/ftp/pub/hugh/jove-dev

versions    = 4.16.0.73
pkgname     = jove
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$(pkgname)$$version.tgz ; \
	  tar xzf $(pkgname)$$version.tgz ; \
	  mv $(pkgname)$$version $(pkgname)-$$version ; \
	  tar czf $(pkgname)-$$version.$(suffix) $(pkgname)-$$version ; \
	  rm -rf $(pkgname)-$$version $(pkgname)$$version.tgz ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
