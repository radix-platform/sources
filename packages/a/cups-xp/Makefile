#
# Project Home:
# ============
# ... deprecated ...
#
# Downloads:
# =========
# http://ftp.ntua.gr/mirror/gnu/cups/windows
#

url         = http://ftp.ntua.gr/mirror/gnu/cups/windows

suffix      = tar.gz

tarballs    = cups-samba-5.0rc3.tar.gz
tarballs   += cups-windows-6.0-source.tar.gz

files       = cups-windows-psprint.patch.gz
files      += cups-windows-psprint.readme

sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(files) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(files):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(files) $(sha1s)
