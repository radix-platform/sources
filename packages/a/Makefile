
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := CLooG         \
           acl           \
           adjtimex      \
           attr          \
           bsdstrings    \
           bzip2         \
           ctags         \
           db            \
           dcron         \
           dialog        \
           dosfstools    \
           e2fsprogs     \
           e2fsprogs-git \
           eudev         \
           fakeroot-ng   \
           file          \
           flex          \
           getty-ps      \
           gpm           \
           hdparm        \
           initscripts   \
           jfsutils      \
           kbd           \
           kmod          \
           lha           \
           lha-debian    \
           libcgroup     \
           linuxconsole  \
           logrotate     \
           lua           \
           mc            \
           ncompress     \
           pciutils      \
           pcmciautils   \
           procinfo      \
           procps        \
           psmisc        \
           reiserfsprogs \
           sash          \
           sdparm        \
           setserial     \
           shadow        \
           sysfsutils    \
           sysklogd      \
           sysvinit      \
           udev          \
           udev-git      \
           updated       \
           usbutils      \
           util-linux    \
           vim           \
           vim-hg        \
           xfs           \
           xz            \
           ziptool


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
