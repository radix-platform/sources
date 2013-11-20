
#
# uClinux: http://www.uclinuc.org
#

url        = :pserver:anonymous@cvs.uclinux.org:/var/cvs

pkg_name   = elf2flt

#
# List of tags to be extracted:
#
TAGS       = elf2flt-1.6
TAGS      += elf2flt-1.64


versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-z0-9A-Z-]*\)\([0-9][.0-9]*\)\(.*\)/\2/'))
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(pkg_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = checked_out_clean

all: $(TARGETS)

.PHONY: downloads_clean checked_out_clean


$(tarballs):
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-z0-9A-Z-]*\)\([0-9][.0-9]*\)\(.*\)/\2/'` ; \
	  if [ ! -f $$tag.tar.bz2 ]; then \
	    echo -e "\n======= Checkout '$$tag' source tree =======" ; \
	    ( cvs -z3 -d$(url) co -r $$version -f -R -d $$tag $(pkg_name) && \
	      rm -rf $$tag/CVS ) ; \
	    echo -e "\n======= Creating '$$tag.tar.bz2' tarball =======" ; \
	    tar cjvf $$tag.tar.bz2 $$tag ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

checked_out_clean: $(tarballs) $(sha1s)
	@rm -rf $(TAGS)
	@echo -e ""

downloads_clean:
	@rm -f $(tarballs) $(sha1s)
