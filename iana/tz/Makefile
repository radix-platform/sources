#
# Home:
# ============
# ftp://ftp.iana.org/tz/tz-link.html
#

# tzcode, tzdata: manualy downloaded from:
#
# tz_url = ftp://ftp.iana.org/tz/releases/ (latest is tz*2013i.tar.gz 12/19/2013)
#
# tzcode2013i.tar.gz
# tzdata2013i.tar.gz
#


url         = ftp://ftp.iana.org/tz/releases

tarballs    = tz*2013[h-i].tar.gz tz*2014[i-j].tar.gz tz*2015[a].tar.gz

sha1s       = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.tar.gz.sha1sum : %.tar.gz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
