
#
# EGLIBC: http://www.eglibc.org
#

url      = http://www.eglibc.org

BRANCH   = eglibc-2_15
REVISION = 25241
VERSION  = 2.15.1

# 2.19.1:
tarballs  = eglibc-$(VERSION).tar.bz2
tarballs += eglibc-localedef-$(VERSION).tar.bz2
tarballs += eglibc-ports-$(VERSION).tar.bz2

sha1s     = $(addsuffix .sha1sum, $(tarballs))

all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Export EGLIBC SVN branch ======="
	@rm -rf eglibc-$(VERSION)-r$(REVISION)
	@svn export -r $(REVISION) $(url)/svn/branches/$(BRANCH) eglibc-$(VERSION)-r$(REVISION)
	@echo -e "\n======= Create EGLIBC tarballs ======="
	@( if [ -d eglibc-$(VERSION)-r$(REVISION) ]; then \
	     cd eglibc-$(VERSION)-r$(REVISION) ; \
	     mv libc eglibc-$(VERSION) || exit 1 ; \
	     tar cjvf ../eglibc-$(VERSION).tar.bz2 eglibc-$(VERSION) || exit 1 ; \
	     mv localedef eglibc-localedef-$(VERSION) || exit 1 ; \
	     tar cjvf ../eglibc-localedef-$(VERSION).tar.bz2 eglibc-localedef-$(VERSION) || exit 1 ; \
	     mv ports eglibc-ports-$(VERSION) || exit 1 ; \
	     tar cjvf ../eglibc-ports-$(VERSION).tar.bz2 eglibc-ports-$(VERSION) || exit 1 ; \
	     cd .. ; \
	     rm -rf eglibc-$(VERSION)-r$(REVISION) ; \
	   fi )

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf eglibc-$(VERSION)-r$(REVISION)
