#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/gdb
#

url         = http://ftpmirror.gnu.org/gdb

tarballs    = gdb-6.4a.tar.bz2
tarballs   += gdb-6.5a.tar.bz2
tarballs   += gdb-7.0a.tar.bz2
tarballs   += gdb-7.2a.tar.bz2
tarballs   += gdb-7.5.tar.bz2

signatures  = gdb-6.4a.tar.bz2.sig
signatures += gdb-6.5a.tar.bz2.sig
signatures += gdb-7.0a.tar.bz2.sig
signatures += gdb-7.2a.tar.bz2.sig
signatures += gdb-7.5.tar.bz2.sig

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
