#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/mpfr/mpfr-$(version)
#

#url         = http://ftpmirror.gnu.org/mpfr
url         = http://ftp.gnu.org/gnu/mpfr

versions    = 2.4.2 3.1.1 3.1.2 3.1.3 3.1.4 3.1.5 4.0.1 4.0.2

tarballs    = $(addsuffix .tar.xz, $(addprefix mpfr-, $(versions)))
tarballs   += $(addsuffix .tar.bz2, $(addprefix mpfr-, $(versions)))

sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(filter %.tar.xz.sha1sum,$(sha1s)): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

$(filter %.tar.bz2.sha1sum,$(sha1s)): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
