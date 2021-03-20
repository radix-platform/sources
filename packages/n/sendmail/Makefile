#
# Project Home:
# ============
# http://www.sendmail.com/sm/open_source
#
# Downloads:
# =========
# ftp://ftp.sendmail.org/pub/sendmail
#

url         = http://ftp.sendmail.org

versions    = 8.14.7 8.14.8 8.14.9 8.15.2 8.16.1
pkg_name    = sendmail
arch_type   = tar.gz
suffixes    = $(arch_type) $(arch_type).sig

pgpkeys     = PGPKEYS

files       = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))
tarballs    = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s) $(pgpkeys)


.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading '$(pkg_name)' sourses =======\n"
	@for version in $(versions) ; do \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name).$$version.$$suffix ; \
	    mv $(pkg_name).$$version.$$suffix $(pkg_name)-$$version.$$suffix ; \
	  done ; \
	done

$(pgpkeys):
	@echo -e "\n======= Downloading '$(pgpkeys)' file =======\n"
	@wget -O $(pgpkeys).gpg $(url)/$(pgpkeys) ; \

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s) $(pgpkeys)
