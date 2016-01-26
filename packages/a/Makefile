
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := CLooG                 \
           acl                   \
           acpid                 \
           adjtimex              \
           adjtimex-debian       \
           apcupsd               \
           apmd                  \
           ash                   \
           at                    \
           attr                  \
           banners               \
           bpe                   \
           bsdstrings            \
           btrfs-progs           \
           bzip2                 \
           chrpath               \
           cpufreqitils          \
           cryptsetup            \
           ctags                 \
           cups                  \
           cups-filters          \
           cups-xp               \
           db                    \
           dbus                  \
           dc3dd                 \
           dcron                 \
           debianutils           \
           devs-debian           \
           dialog                \
           diffstat              \
           dmidecode             \
           dosfstools            \
           e2fsprogs             \
           e2fsprogs-git         \
           efibootmgr            \
           eject                 \
           elilo                 \
           elvis                 \
           eudev                 \
           eudev-github          \
           fakeroot              \
           fakeroot-ng           \
           fdutils               \
           file                  \
           foomatic-db           \
           foomatic-db-engine    \
           foomatic-db-nonfree   \
           foomatic-filters      \
           foomatic-filters-tarballs \
           genext2fs             \
           genpower-debian       \
           getty-ps              \
           ghostscript           \
           ghostscript-fonts-std \
           gphoto2               \
           gpm                   \
           gptfdisk              \
           gutenprint            \
           hdparm                \
           hplip                 \
           htop                  \
           i2c-tools             \
           infozip               \
           initscripts           \
           inotify-tools         \
           isapnptools           \
           ispell                \
           itstool               \
           jbigkit               \
           jed                   \
           jfsutils              \
           joe                   \
           jove                  \
           jsmin                 \
           kbd                   \
           kmod                  \
           lha                   \
           lha-debian            \
           libcgroup             \
           libx86                \
           lilo                  \
           linuxconsole          \
           linuxdoc-tools        \
           lm_sensors            \
           logrotate             \
           lrzip                 \
           lsof                  \
           lsscsi                \
           lua                   \
           lvm2                  \
           lxc                   \
           lzip                  \
           man                   \
           man-pages             \
           man-pages-posix       \
           mc                    \
           mcelog                \
           mdadm                 \
           minicom               \
           mktemp                \
           mlocate               \
           most                  \
           mt-st                 \
           mtx                   \
           nano                  \
           ncompress             \
           ntfs-3g               \
           os-prober             \
           pciutils              \
           pcmciautils           \
           pm-utils              \
           populatefs            \
           powertop              \
           procinfo              \
           procps                \
           psmisc                \
           psutils               \
           qpdf                  \
           quota                 \
           radeontool            \
           reiserfsprogs         \
           rpm                   \
           rzip                  \
           sash                  \
           sc                    \
           sdparm                \
           seejpeg               \
           setserial             \
           shadow                \
           slocate               \
           smartmontools         \
           splitvt               \
           sudo                  \
           sysfsutils            \
           sysklogd              \
           syslinux              \
           sysstat               \
           sysvinit              \
           tcsh                  \
           tmux                  \
           todos                 \
           tree                  \
           udev                  \
           udev-git              \
           udisks                \
           udisks2               \
           unarj                 \
           updated               \
           upower                \
           usb-modeswitch        \
           usb-modeswitch-data   \
           usbutils              \
           utempter              \
           util-linux            \
           vbetool               \
           vim                   \
           vim-hg                \
           vim-github            \
           xfs                   \
           xz                    \
           ziptool               \
           zoo                   \
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
