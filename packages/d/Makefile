
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := LLVM          \
           check         \
           cmake         \
           flex          \
           intltool      \
           llvm          \
           meson         \
           ninja         \
           orc           \
           perl          \
           perl-cross    \
           perl-modules  \
           pike          \
           pkg-config    \
           python2       \
           python2-doc   \
           python3       \
           python3-doc   \
           qt-creator    \
           re2c


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
