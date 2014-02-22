#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/gcc/gcc-$(version)
#

#url         = http://ftpmirror.gnu.org/gcc
url         = http://ftp.gnu.org/gnu/gcc

versions    = 2.95.3

tarballs    = $(addsuffix .tar.gz, $(addprefix gcc-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(keyring) $(sha1s)

.PHONY: downloads_clean

$(keyring):
	@cd .. ; $(MAKE) all

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/gcc-$$version.tar.gz ; \
	done

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
