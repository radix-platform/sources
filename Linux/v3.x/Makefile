#
# url = http://www.kernel.org/pub/linux/kernel/v[2.6|3.x]
#
# mirrors:
#
# url = http://www.se.kernel.org/pub/linux/kernel/v[2.6|3.x]
#

url         = http://www.kernel.org/pub/linux/kernel/v3.x

keyring     = ../keyring-6092693E.gpg

versions    = 3.10.17 3.18.20

tarballs    = $(addsuffix .tar.xz, $(addprefix linux-, $(versions)))
signatures  = $(addsuffix .sign, $(subst .xz,, $(tarballs)))
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

$(signatures): %.tar.sign : %.tar.xz
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	  echo -e "======= Unpacking '$(subst .xz,,$<)' for verification =======\n" ; \
	  xz --decompress --force --keep $< ; \
	  echo -e "======= Verification of '$(subst .xz,,$<)' signature =======\n" ; \
	  gpg --verify --keyring $(keyring) $$signature ; ret="$$?" ; \
	  if [ "$$ret" == "1" ]; then \
	    echo -e "\n======= ERROR: Bad '$$signature' Signature =======\n" ; \
	    exit 1 ; \
	  fi ; \
	  rm -f $(subst .xz,,$<) ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
