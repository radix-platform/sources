#
# In a directory with the keyring file, the source file to verify and the
# signature file, the command to use is:
#
#  $ gpg --verify --keyring ./keyring.gpg foo.tar.xz.sign
#
# original url: http://uClibc.org/~aldot/gpg.asc
#

url            = http://uClibc.org/~aldot/
locale_url     = http://codepoet.org/andersen/erik/gpg.asc

gnu_keyring           = gpg.asc
uClibc_keyring        = uClibc.asc
uClibc_locale_keyring = uClibc-locale.asc
IDs                   = D0D311DA 30D39057

keyrings = $(addsuffix .gpg, $(addprefix keyring-, $(IDs)))

all: $(uClibc_keyring) $(uClibc_locale_keyring) $(keyrings)

.PHONY: downloads_clean

$(uClibc_keyring):
	@echo -e "\n======= Downloading $(gnu_keyring) file =======\n"
	@wget $(url)/$(gnu_keyring)
	@mv $(gnu_keyring) $(uClibc_keyring)

$(uClibc_locale_keyring):
	@echo -e "\n======= Downloading $(gnu_keyring) file =======\n"
	@wget $(url)/$(gnu_keyring)
	@mv $(gnu_keyring) $(uClibc_locale_keyring)

$(keyrings):
	@echo -e "\n======= Downloading keyring files =======\n"
	@for ID in $(IDs) ; do \
	  gpg --recv-key $$ID ; \
	  gpg --export $$ID > keyring-$$ID.gpg ; \
	  gpg --batch --yes --delete-key $$ID ; \
	done

downloads_clean:
	@rm -f $(uClibc_keyring) $(uClibc_locale_keyring) $(keyrings)
