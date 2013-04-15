#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/binutils
#

url         = http://ftpmirror.gnu.org/binutils

# 2.23:
tarballs    = binutils-2.23.tar.gz
signatures  = binutils-2.23.tar.gz.sig

# 2.22:
tarballs   += binutils-2.22.tar.bz2
signatures += binutils-2.22.tar.bz2.sig

# 2.21.1:
tarballs   += binutils-2.21.1.tar.bz2
tarballs   += binutils-2.21.1a.tar.bz2
signatures += binutils-2.21.1a.tar.bz2.sig

# 2.20.1:
tarballs   += binutils-2.20.1.tar.bz2
tarballs   += binutils-2.20.1a.tar.bz2
signatures += binutils-2.20.1a.tar.bz2.sig

# 2.16.1:
tarballs   += binutils-2.16.1.tar.bz2
tarballs   += binutils-2.16.1a.tar.bz2
signatures += binutils-2.16.1a.tar.bz2.sig

all: $(tarballs) $(signatures)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs ======="
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures):
	@echo -e "\n======= Downloading tarball signatures ======="
	@for signature in $(signatures) ; do \
	  wget -N $(url)/$$signature ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures)
