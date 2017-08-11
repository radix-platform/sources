
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := GNOME                   \
           GNU                     \
           Linux                   \
           U-Boot                  \
           Wayland                 \
           X.org                   \
           dict                    \
           hal/kernel-firmware     \
           hal/omap/sgx-ddk        \
           hal/omap/wl18xx         \
           hal/omap/wl18xx_fw      \
           newlib                  \
           tools                   \
           uClinux/elf2flt         \
           uClinux/uClibc          \
           dm644x/flash-tools/IRAM-flasher \
           dm644x/flash-tools/IRAM-loader  \
           dm644x/flash-tools/NOR-flasher  \
           dm644x/modSign          \
           packages

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
