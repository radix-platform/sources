
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := r4p0  \
           r4p1  \
           r5p0  \
           r5p1  \
           r5p2  \
           r6p0  \
           r6p1  \
           r6p2  \
           r7p0  \
           r10p0 \
           r11p0


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
