
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := WindowMaker         \
           dejavu-fonts        \
           dejavu-fonts-ttf    \
           desktop-file-utils  \
           fontconfig          \
           glew                \
           glu                 \
           gst-plugins-base    \
           gstreamer           \
           hicolor-icon-theme  \
           libdrm              \
           libepoxy            \
           libevdev            \
           libinput            \
           libtxc_dxtn         \
           mesa                \
           mesa-demos          \
           mozilla-firefox     \
           mozilla-thunderbird \
           mtdev               \
           qt4                 \
           qt5                 \
           terminus-font       \
           thaixfonts          \
           xdg-utils           \
           xterm


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
