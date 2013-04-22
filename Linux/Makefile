#
# In a directory with the keyring file, the source file to verify and the
# signature file, the command to use is:
#
#  $ gpg --verify --keyring ./gnu-keyring.gpg foo.tar.xz.sig 
#
# original url: ftp:://ftp.gnu.org/gnu/gnu-keyring.gpg
#

IDs      = 517D0F0E 6092693E

keyrings = $(addsuffix .gpg, $(addprefix keyring-, $(IDs)))

all: $(keyrings)

.PHONY: downloads_clean

$(keyrings):
	@echo -e "\n======= Downloading keyring files =======\n"
	@for ID in $(IDs) ; do \
	  gpg --recv-key $$ID ; \
	  gpg --export $$ID > keyring-$$ID.gpg ; \
	  gpg --batch --yes --delete-key $$ID ; \
	done

downloads_clean:
	@rm -f $(keyrings)
