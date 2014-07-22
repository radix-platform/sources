#
# Project Home:
# ============
# http://www.midnight-commander.org
#
# Downloads:
# =========
# http://ftp.midnight-commander.org
# ftp://ftp.midnight-commander.org/pub/midnightcommander
#

url         = ftp://ftp.midnight-commander.org/pub/midnightcommander

versions    = 4.8.10 4.8.12
pkg_name    = mc
suffix      = tar.xz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
