
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := GNU/EGLIBC/2.12.1 \
           GNU/EGLIBC/2.16.1 \
           GNU/binutils      \
           GNU/gcc           \
           GNU/gdb           \
           Linux             \
           Linux/dm644x      \
           Linux/mips        \
           Linux/omap        \
           newlib            \
           dm644x/flash-tools/IRAM-flasher \
           dm644x/flash-tools/IRAM-loader  \
           dm644x/flash-tools/NOR-flasher  \
           dm644x/modSign

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
