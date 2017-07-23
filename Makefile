
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := GNOME                   \
           GNU                     \
           GNU/EGLIBC/2.12.1       \
           GNU/EGLIBC/2.15.1       \
           GNU/EGLIBC/2.16.1       \
           GNU/EGLIBC/2.17.1       \
           GNU/EGLIBC/2.18.1       \
           GNU/EGLIBC/2.19.1       \
           GNU/a2ps                \
           GNU/acct                \
           GNU/aspell              \
           GNU/autoconf            \
           GNU/autoconf-archive    \
           GNU/automake            \
           GNU/bash                \
           GNU/bc                  \
           GNU/binutils            \
           GNU/bison               \
           GNU/coreutils           \
           GNU/cpio                \
           GNU/ddrescue            \
           GNU/diffutils           \
           GNU/ed                  \
           GNU/enscript            \
           GNU/findutils           \
           GNU/gawk                \
           GNU/gcc                 \
           GNU/gcc/gcc-4.5.1       \
           GNU/gcc/gcc-4.7.2       \
           GNU/gcc/gcc-4.7.3       \
           GNU/gcc/gcc-4.8.2       \
           GNU/gcc/gcc-4.8.5       \
           GNU/gcc/gcc-4.9.1       \
           GNU/gcc/gcc-4.9.2       \
           GNU/gcc/gcc-4.9.3       \
           GNU/gcc/gcc-4.9.4       \
           GNU/gcc/gcc-5.2.0       \
           GNU/gcc/gcc-5.3.0       \
           GNU/gcc/gcc-5.4.0       \
           GNU/gcc/gcc-6.2.0       \
           GNU/gcc/gcc-6.3.0       \
           GNU/gcc/gcc-6.4.0       \
           GNU/gcc/gcc-7.1.0       \
           GNU/gdb                 \
           GNU/gdbm                \
           GNU/gettext             \
           GNU/glibc               \
           GNU/gmp                 \
           GNU/gperf               \
           GNU/grep                \
           GNU/groff               \
           GNU/grub                \
           GNU/gss                 \
           GNU/guile               \
           GNU/gzip                \
           GNU/help2man            \
           GNU/inetutils           \
           GNU/less                \
           GNU/libiconv            \
           GNU/libidn              \
           GNU/libtasn1            \
           GNU/libtool             \
           GNU/libunistring        \
           GNU/m4                  \
           GNU/make                \
           GNU/mpc                 \
           GNU/multiprecision      \
           GNU/mpfr                \
           GNU/mtools              \
           GNU/ncurses/5.9         \
           GNU/patch               \
           GNU/pth                 \
           GNU/readline            \
           GNU/screen              \
           GNU/sed                 \
           GNU/sharutils           \
           GNU/shtool              \
           GNU/tar                 \
           GNU/termcap             \
           GNU/termutils           \
           GNU/texinfo             \
           GNU/time                \
           GNU/uucp                \
           GNU/wget                \
           GNU/which               \
           Linux                   \
           Linux/Allwinner         \
           Linux/Amlogic           \
           Linux/Baikal            \
           Linux/Boundary          \
           Linux/Freescale         \
           Linux/Hardkernel        \
           Linux/Ingenic           \
           Linux/Khadas            \
           Linux/Rockchip          \
           Linux/TI                \
           Linux/dm644x            \
           Linux/mips              \
           Linux/omap              \
           Linux/sunxi             \
           Linux/v2.6              \
           Linux/v3.x              \
           Linux/v4.x              \
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
