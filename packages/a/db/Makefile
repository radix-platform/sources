#
# Project Home:
# ============
# http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/downloads/index.html
#
# Downloads:
# =========
# http://download.oracle.com/berkeley-db
#
# Instruction:
# ===========
#
# 1) Check newest releases at
#      http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/downloads/index.html
#    page.
# 2) Download needed archive from
#      http://download.oracle.com/berkeley-db/
#    directory.
#
# reserved URL:
# ============
# url         = ftp://ftp.radix.pro/3pp/Berkeley-DB
#
url         = http://download.oracle.com/berkeley-db

versions    = 5.3.28 6.1.19 6.1.26 18.1.40
pkgname     = db
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
