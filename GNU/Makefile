
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := EGLIBC/2.12.1       \
           EGLIBC/2.15.1       \
           EGLIBC/2.16.1       \
           EGLIBC/2.17.1       \
           EGLIBC/2.18.1       \
           EGLIBC/2.19.1       \
           a2ps                \
           acct                \
           aspell              \
           autoconf            \
           autoconf-archive    \
           automake            \
           bash                \
           bc                  \
           binutils            \
           bison               \
           coreutils           \
           cpio                \
           ddrescue            \
           diffutils           \
           ed                  \
           enscript            \
           findutils           \
           gawk                \
           gcc                 \
           gcc/gcc-4.5.1       \
           gcc/gcc-4.7.2       \
           gcc/gcc-4.7.3       \
           gcc/gcc-4.8.2       \
           gcc/gcc-4.8.5       \
           gcc/gcc-4.9.1       \
           gcc/gcc-4.9.2       \
           gcc/gcc-4.9.3       \
           gcc/gcc-4.9.4       \
           gcc/gcc-5.2.0       \
           gcc/gcc-5.3.0       \
           gcc/gcc-5.4.0       \
           gcc/gcc-6.2.0       \
           gcc/gcc-6.3.0       \
           gcc/gcc-6.4.0       \
           gcc/gcc-6.5.0       \
           gcc/gcc-7.1.0       \
           gcc/gcc-7.2.0       \
           gcc/gcc-7.3.0       \
           gcc/gcc-7.4.0       \
           gcc/gcc-7.5.0       \
           gcc/gcc-8.2.0       \
           gcc/gcc-8.3.0       \
           gcc/gcc-9.2.0       \
           gcc/gcc-9.3.0       \
           gcc/gcc-10.2.0      \
           gdb                 \
           gdbm                \
           gettext             \
           glibc               \
           gmp                 \
           gperf               \
           grep                \
           groff               \
           grub                \
           gss                 \
           guile               \
           gzip                \
           help2man            \
           inetutils           \
           less                \
           libiconv            \
           libidn              \
           libtasn1            \
           libtool             \
           libunistring        \
           m4                  \
           make                \
           mpc                 \
           multiprecision      \
           mpfr                \
           mtools              \
           ncurses/5.9         \
           patch               \
           pth                 \
           readline            \
           screen              \
           sed                 \
           sharutils           \
           shtool              \
           tar                 \
           termcap             \
           termutils           \
           texinfo             \
           time                \
           uucp                \
           wget                \
           which

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
