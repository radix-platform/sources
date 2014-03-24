#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/gmp/gmp-$(version)
#

#url         = http://ftpmirror.gnu.org/gmp
url         = http://ftp.gnu.org/gnu/gmp

keyring     = ../keyring-765C61E3.gpg

versions    = 4.3.1 5.0.5 5.1.3

tarballs    = $(addsuffix .tar.bz2, $(addprefix gmp-, $(versions)))
signatures  = $(addsuffix .sig, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(keyring) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(keyring):
	@cd .. ; $(MAKE) all

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.tar.bz2.sig : %.tar.bz2
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	  gpg --verify --keyring $(keyring) $$signature ; ret="$$?" ; \
	  if [ "$$ret" == "1" ]; then \
	    echo -e "\n======= ERROR: Bad '$$signature' Signature =======\n" ; \
	    exit 1 ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)