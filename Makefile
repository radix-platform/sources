
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := GNOME               \
           GNU                 \
           GNU/EGLIBC/2.12.1   \
           GNU/EGLIBC/2.16.1   \
           GNU/EGLIBC/2.17.1   \
           GNU/EGLIBC/2.18.1   \
           GNU/EGLIBC/2.19.1   \
           GNU/bash            \
           GNU/binutils        \
           GNU/coreutils       \
           GNU/diffutils       \
           GNU/findutils       \
           GNU/gcc             \
           GNU/gcc/gcc-4.5.1   \
           GNU/gcc/gcc-4.7.2   \
           GNU/gcc/gcc-4.7.3   \
           GNU/gcc/gcc-4.8.2   \
           GNU/gdb             \
           GNU/gettext         \
           GNU/gmp             \
           GNU/gperf           \
           GNU/grep            \
           GNU/guile           \
           GNU/gzip            \
           GNU/inetutils       \
           GNU/libiconv        \
           GNU/libidn          \
           GNU/libtasn1        \
           GNU/libunistring    \
           GNU/mpc             \
           GNU/multiprecision  \
           GNU/mpfr            \
           GNU/ncurses/5.9     \
           GNU/patch           \
           GNU/pth             \
           GNU/readline        \
           GNU/sed             \
           GNU/termcap         \
           GNU/termutils       \
           GNU/wget            \
           Linux               \
           Linux/dm644x        \
           Linux/mips          \
           Linux/omap          \
           Linux/omap5         \
           Linux/omap5-glsdk   \
           Linux/sunxi         \
           Linux/v2.6          \
           Linux/v3.x          \
           U-Boot/denx         \
           U-Boot/omap5        \
           U-Boot/omap5-glsdk  \
           U-Boot/sunxi        \
           hal/omap/sgx-ddk    \
           hal/omap/wl18xx     \
           hal/omap/wl18xx_fw  \
           newlib              \
           uClinux/elf2flt     \
           uClinux/uClibc      \
           dm644x/flash-tools/IRAM-flasher \
           dm644x/flash-tools/IRAM-loader  \
           dm644x/flash-tools/NOR-flasher  \
           dm644x/modSign      \
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
