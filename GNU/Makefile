#
# In a directory with the keyring file, the source file to verify and the
# signature file, the command to use is:
#
#  $ gpg --verify --keyring ./gnu-keyring.gpg foo.tar.xz.sig 
#
# original url: ftp:://ftp.gnu.org/gnu/gnu-keyring.gpg
#

url         = ftp://ftp.gnu.org/gnu

keyring     = gnu-keyring.gpg

all: $(keyring)

.PHONY: downloads_clean

$(keyring):
	@echo -e "\n======= Downloading $(keyring) file =======\n"
	@wget $(url)/$(keyring)

downloads_clean:
	@rm -rf $(keyring)
