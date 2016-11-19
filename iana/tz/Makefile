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

patterns    = tz*2013[h-i].tar.gz
patterns   += tz*2014[i-j].tar.gz
patterns   += tz*2015[a-cg].tar.gz
patterns   += tz*2016[a-i].tar.gz

tarballs   := $(wildcard *.tar.gz)
sha1s      := $(patsubst %.tar.gz,%.tar.gz.sha1sum,$(wildcard *.tar.gz))

all: download

.PHONY: download downloads_clean

download:
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(patterns) ; do \
	   wget -N $(url)/$$tarball ; \
	 done
	@echo -e "\n======= End of downloading =======\n"
	@for tarball in `ls *.tar.gz` ; do \
	   echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	   sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	 done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
