
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := CLooG           \
           acl             \
           acpid           \
           adjtimex        \
           apcupsd         \
           apmd            \
           attr            \
           banners         \
           bsdstrings      \
           btrfs-progs     \
           bzip2           \
           cpufreqitils    \
           cryptsetup      \
           ctags           \
           cups            \
           cups-xp         \
           db              \
           dbus            \
           dcron           \
           debianutils     \
           devs-debian     \
           dialog          \
           dosfstools      \
           e2fsprogs       \
           e2fsprogs-git   \
           efibootmgr      \
           eject           \
           elilo           \
           elvis           \
           eudev           \
           fakeroot-ng     \
           fdutils         \
           file            \
           genpower-debian \
           flex            \
           getty-ps        \
           gpm             \
           gptfdisk        \
           hdparm          \
           infozip         \
           initscripts     \
           jfsutils        \
           kbd             \
           kmod            \
           lha             \
           lha-debian      \
           libcgroup       \
           linuxconsole    \
           logrotate       \
           lua             \
           mc              \
           mktemp          \
           ncompress       \
           pciutils        \
           pcmciautils     \
           procinfo        \
           procps          \
           psmisc          \
           reiserfsprogs   \
           sash            \
           sdparm          \
           setserial       \
           shadow          \
           sysfsutils      \
           sysklogd        \
           sysvinit        \
           tmux            \
           todos           \
           udev            \
           udev-git        \
           updated         \
           usbutils        \
           utempter        \
           util-linux      \
           vim             \
           vim-hg          \
           xfs             \
           xz              \
           ziptool         \
           zsh


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
