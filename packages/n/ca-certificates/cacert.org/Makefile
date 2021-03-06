
cacert_home     = http://www.cacert.org/index.php?id=3
cacert_url      = http://www.cacert.org/certs
cacert_files    = root class3
cacert_suffixes = crt der txt
cacert_asc      = cacert.asc

ID              = 65D0FD58
signatures      = sign/cacert-fingerprint.txt sign/cacert-gpg-fingerprint.txt

tarball         = cacert.tar.xz
suffix          = $(shell echo $(tarball) | cut -f 2,3 -d '.')
sha1s           = $(addsuffix .sha1sum, $(tarball))

files  = $(foreach sfx, $(cacert_suffixes), $(addsuffix .$(sfx),$(cacert_files)))
files += $(cacert_asc)

all: $(tarball) $(sha1s)

.PHONY: verify downloads_clean


$(files):
	@echo -e "\n======= Downloading cacert.org certificates =======\n"
	@for file in $(files) ; do \
	   wget -N $(cacert_url)/$$file ; \
	 done

$(tarball): $(files)
	@( directory=`echo $(tarball) | cut -f 1 -d '.'`    ; \
	   mkdir -p $$directory                             ; \
	   cp -a sign $$directory                           ; \
	   cp -a README *.crt *.der *.txt *.asc $$directory ; \
	   tar cJvf $(tarball) $$directory                  ; \
	   rm -rf $$directory                               ; \
	   rm -f *.crt *.der *.txt *.asc                    ; \
	 )

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -f $(tarball) $(sha1s) *.crt *.der *.txt *.asc *.gpg
