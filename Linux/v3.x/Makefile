#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v3.x

keyring     = ../keyring-6092693E.gpg

versions    = 3.5.4 3.8.5 3.10.17

tarballs    = $(addsuffix .tar.bz2, $(addprefix linux-, $(versions)))
signatures  = $(addsuffix .sign, $(subst .bz2,, $(tarballs)))
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

$(signatures): %.tar.sign : %.tar.bz2
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	  echo -e "======= Unpacking '$(subst .bz2,,$<)' for verification =======\n" ; \
	  bunzip2 --force --keep $< ; \
	  echo -e "======= Verification of '$(subst .bz2,,$<)' signature =======\n" ; \
	  gpg --verify --keyring $(keyring) $$signature ; ret="$$?" ; \
	  if [ "$$ret" == "1" ]; then \
	    echo -e "\n======= ERROR: Bad '$$signature' Signature =======\n" ; \
	    exit 1 ; \
	  fi ; \
	  rm -f $(subst .bz2,,$<) ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
