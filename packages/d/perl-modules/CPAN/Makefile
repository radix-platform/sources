
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := Clone                 \
           DBD-Pg                \
           DBD-mysql             \
           DBI                   \
           Locale-gettext        \
           Module-Install        \
           URI                   \
           XML-LibXML            \
           XML-NamespaceSupport  \
           XML-Parser            \
           XML-SAX               \
           XML-SAX-Base          \
           XML-SAX-Expat         \
           XML-Simple


all-recursive downloads_clean-recursive:
	@set fnord $(MAKEFLAGS); amf=$$2; \
	target=`echo $@ | sed s/-recursive//`; \
	list='$(SUBDIRS)'; for subdir in $$list; do \
	  echo "Making $$target in $$subdir"; \
	  local_target="$$target"; \
	  (cd $$subdir && $(MAKE) $$fnord $$local_target) \
	   || case "$$amf" in *=*) exit 1;; *k*) fail=yes;; *) exit 1;; esac; \
	done; test -z "$$fail"

all: all-recursive

downloads_clean: downloads_clean-recursive

.PHONY: all-recursive downloads_clean-recursive all downloads_clean
