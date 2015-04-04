
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := r3p0-04rel0 \
           r3p2-01rel2 \
           r4p0-00rel0 \
           r4p0-00rel1 \
           r4p1-01rel0 \
           r5p0-01rel0 \
           r5p1-01rel0


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
