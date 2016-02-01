#
# Project Home:
# ============
# http://www.epicsol.org
#
# Downloads:
# =========
# ftp://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION
#

url         = http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION
help_url    = http://ftp.epicsol.org/pub/epic/help

pkgname     = epic5

old_versions    = 1.1.6 1.1.9 1.1.10
old_suffix      = tar.bz2

old_tarballs    = $(addsuffix .$(old_suffix), $(addprefix $(pkgname)-, $(old_versions)))
old_sha1s       = $(addsuffix .sha1sum, $(old_tarballs))

new_versions    = 1.4 1.6 1.8
new_suffix      = tar.xz

new_tarballs    = $(addsuffix .$(new_suffix), $(addprefix $(pkgname)-, $(new_versions)))
new_sha1s       = $(addsuffix .sha1sum, $(new_tarballs))

help            = epic-help-current.tar.gz
help_sha1s     += epic-help-current.tar.gz.sha1sum

tarballs        = $(new_tarballs) $(old_tarballs)


all: $(tarballs) $(old_sha1s) $(new_sha1s) $(help) $(help_sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(old_sha1s): %.$(old_suffix).sha1sum : %.$(old_suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(new_sha1s): %.$(new_suffix).sha1sum : %.$(new_suffix)
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
	@rm -rf $(tarballs) $(old_sha1s) $(new_sha1s) $(help) $(help_sha1s)
