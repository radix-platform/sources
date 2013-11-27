#
# Original url: http://www.uclibc.org/downloads/
#

url             = http://www.uclibc.org/downloads

keyring         = ../keyring-D0D311DA.gpg
locale_keyring  = ../keyring-30D39057.gpg

versions        = 0.9.33.1 0.9.33.2
locale_versions = 030818

tarballs    = $(addsuffix .tar.bz2, $(addprefix uClibc-, $(versions)))
signatures  = $(addsuffix .sign, $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

locale_tarballs   = $(addsuffix .tgz, $(addprefix uClibc-locale-, $(locale_versions)))
locale_signatures = $(addsuffix .sign, $(locale_tarballs))
locale_sha1s      = $(addsuffix .sha1sum, $(locale_tarballs))

all: $(keyring) $(locale_keyring) $(signatures) $(sha1s) $(locale_signatures) $(locale_sha1s)

.PHONY: downloads_clean

$(keyring):
	@cd .. ; $(MAKE) all

$(locale_keyring):
	@cd .. ; $(MAKE) all

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(locale_tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(locale_tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.tar.bz2.sign : %.tar.bz2
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

$(locale_signatures): %.tgz.sign : %.tgz
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	  gpg --verify --keyring $(locale_keyring) $$signature ; ret="$$?" ; \
	  if [ "$$ret" == "1" ]; then \
	    echo -e "\n======= ERROR: Bad '$$signature' Signature =======\n" ; \
	    exit 1 ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(locale_sha1s): %.tgz.sha1sum : %.tgz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(locale_tarballs) $(signatures) $(locale_signatures) $(sha1s) $(locale_sha1s)
