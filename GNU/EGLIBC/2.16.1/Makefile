
#
# EGLIBC: http://www.eglibc.org
#

url      = http://www.eglibc.org

BRANCH   = eglibc-2_16
REVISION = 22666
VERSION  = 2.16.1

# 2.12.1:
tarballs  = eglibc-$(VERSION).tar.bz2
tarballs += eglibc-localedef-$(VERSION).tar.bz2
tarballs += eglibc-ports-$(VERSION).tar.bz2

all: $(tarballs)

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

downloads_clean:
	@rm -rf $(tarballs)
	@rm -rf eglibc-$(VERSION)-r$(REVISION)
