#
# In a directory with the keyring file, the source file to verify and the
# signature file, the command to use is:
#
#  $ gpg --verify --keyring ./gnu-keyring.gpg foo.tar.xz.sig 
#
# original url: ftp://ftp.gnu.org/gnu/gnu-keyring.gpg
#

url         = ftp://ftp.gnu.org/gnu

gnu_keyring = gnu-keyring.gpg
IDs         = 765C61E3 98C3739D C3C45C06 FC26A641

keyrings = $(addsuffix .gpg, $(addprefix keyring-, $(IDs)))

all: $(gnu_keyring) $(keyrings)

.PHONY: downloads_clean

$(gnu_keyring):
	@echo -e "\n======= Downloading $(gnu_keyring) file =======\n"
	@wget $(url)/$(gnu_keyring)

$(keyrings):
	@echo -e "\n======= Downloading keyring files =======\n"
	@for ID in $(IDs) ; do \
	  gpg --recv-key $$ID ; \
	  gpg --export $$ID > keyring-$$ID.gpg ; \
	  gpg --batch --yes --delete-key $$ID ; \
	done

downloads_clean:
	@rm -f $(gnu_keyring) $(keyrings)
