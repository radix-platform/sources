#
# Project Home:
# ============
# http://www.epicsol.org
#
# Downloads:
# =========
# ftp://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION
#

url         = ftp://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION
help_url    = ftp://ftp.epicsol.org/pub/epic/help

versions    = 1.1.6 1.1.9
pkgname     = epic5
suffix      = tar.bz2

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

help        = epic-help-current.tar.gz
help_sha1s += epic-help-current.tar.gz.sha1sum


all: $(tarballs) $(sha1s) $(help) $(help_sha1s)

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


$(help): $(tarballs)
	@echo -e "\n======= Downloading help tarball =======\n"
	@wget -N --retr-symlinks $(help_url)/$(help)
	@rm -f index.html

$(help_sha1s): $(help)
	@echo -e "\n======= Calculation the '$(help)' sha1sum =======\n"
	@sha1sum --binary $(help) > $(help_sha1s)


downloads_clean:
	@rm -rf $(tarballs) $(sha1s) $(help) $(help_sha1s)
