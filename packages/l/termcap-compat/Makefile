#
# Project Home:
# ============
# http://www.pcre.org/
#
# Downloads:
# =========
# http://archive.debian.org/debian-archive/debian/pool/main/t/termcap-compat/
# http://ftp.de.debian.org/debian-archive/debian/pool/main/t/termcap-compat/
# ftp://ftp.de.debian.org/debian-archive/debian/pool/main/t/termcap-compat/

url         = ftp://ftp.de.debian.org/debian-archive/debian/pool/main/t/termcap-compat

versions    = 1.2.3
pkgname     = termcap-compat
suffix      = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(versions)))
descriptions = $(addsuffix .dsc, $(addprefix $(pkgname)_, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(descriptions) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(descriptions):
	@echo -e "\n======= Downloading source descriptions =======\n"
	@for description in $(descriptions) ; do \
	  wget -N $(url)/$$description ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(descriptions) $(sha1s)
