#
# Project Home:
# ============
# http://www.ietf.org/rfc/rfc951.txt
# ftp://ftp.ntplx.net/pub/networking/bootp
#
# Downloads:
# =========
# ftp://ftp.debian.org/debian/pool/main/b/bootp
#

url         = ftp://ftp.debian.org/debian/pool/main/b/bootp

version     = 2.4.3
pkgname     = bootp
suffix      = orig.tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patch       = $(addsuffix -18.diff.gz, $(addprefix $(pkgname)_, $(version)))
description = $(addsuffix -18.dsc, $(addprefix $(pkgname)_, $(version)))

files       = $(patch) $(description)

all: $(tarball) $(files) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	wget -N $(url)/$(tarball)

$(files): $(tarball)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(files) $(sha1s)
