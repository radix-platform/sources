#
# Project Home:
# ============
#  http://www.cpan.org/modules/index.html
#
# Install instruction:
# ===================
#  http://www.cpan.org/modules/INSTALL.html
#
# Search CPAN:
# ===========
#  https://metacpan.org
#  http://search.cpan.org
#

url         = ftp://radix.pro/3pp/perl-modules/CPAN/URI

versions    = 1.69 1.76
pkgname     = URI
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
