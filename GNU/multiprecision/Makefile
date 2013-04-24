#
# Download: http://www.multiprecision.org/mpc/download
#
# original url: http://www.multiprecision.org
#

url         = http://www.multiprecision.org/mpc/download

keyring     = ../keyring-765C61E3.gpg

versions    = 0.8.2 0.9 1.0

tarballs    = $(addsuffix .tar.gz, $(addprefix mpc-, $(versions)))
signatures  = $(addsuffix .asc, $(tarballs))
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

$(signatures): %.tar.gz.asc : %.tar.gz
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

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
