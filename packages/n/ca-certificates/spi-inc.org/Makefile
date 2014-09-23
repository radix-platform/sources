
cacert_home     = http://www.spi-inc.org/ca
cacert_url      = http://www.spi-inc.org/ca
cacert_files    = spi-cacert.crt

ID              = 7E7B8AC9
signature       = spi-cacert.fingerprint.txt

tarball         = spi-inc.tar.bz2
suffix          = $(shell echo $(tarball) | cut -f 2,3 -d '.')
sha1s           = $(addsuffix .sha1sum, $(tarball))

files  = $(cacert_files) $(signature)

all: $(tarball) $(sha1s)

.PHONY: verify downloads_clean


$(files):
	@echo -e "\n======= Downloading cacert.org certificates =======\n"
	@for file in $(files) ; do \
	   wget -N $(cacert_url)/$$file ; \
	 done

verify: $(files)
	@gpg --recv-key $(ID)
	@gpg --export $(ID) > $(CURDIR)/keyring-$(ID).gpg
	@gpg --batch --yes --delete-key $(ID)
	@for signature in $(signature) ; do \
	   LANG=C gpg --verify --keyring $(CURDIR)/keyring-$(ID).gpg $$signature ; ret="$$?" ; \
	   if [ "$$ret" != "0" ]; then \
	     echo -e "\n======= ERROR: Bad '$$signature' Signature =======\n" ; \
	     exit 1 ; \
	   else \
	     echo -e "\n======= '$$signature' is verified successful =======\n" ; \
	   fi ; \
	 done
	@rm -f $(CURDIR)/keyring-$(ID).gpg

$(tarball): verify
	@( directory=`echo $(tarball) | cut -f 1 -d '.'` ; \
	   mkdir -p $$directory                          ; \
	   cp -a *.crt *.txt $$directory                 ; \
	   tar cjvf $(tarball) $$directory               ; \
	   rm -rf $$directory                            ; \
	   rm -f *.crt *.txt                             ; \
	 )

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -f $(tarball) $(sha1s) *.crt *.txt *.gpg
