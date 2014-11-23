
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := xf86-input-acecad        \
           xf86-input-aiptek        \
           xf86-input-evdev         \
           xf86-input-joystick      \
           xf86-input-keyboard      \
           xf86-input-mouse         \
           xf86-input-penmount      \
           xf86-input-synaptics     \
           xf86-input-vmmouse       \
           xf86-input-void          \
           xf86-video-apm           \
           xf86-video-ark           \
           xf86-video-ast           \
           xf86-video-ati           \
           xf86-video-chips         \
           xf86-video-cirrus        \
           xf86-video-dummy         \
           xf86-video-fbdev         \
           xf86-video-geode         \
           xf86-video-glide         \
           xf86-video-glint         \
           xf86-video-i128          \
           xf86-video-i740          \
           xf86-video-i810          \
           xf86-video-intel         \
           xf86-video-mach64        \
           xf86-video-mga           \
           xf86-video-modesetting   \
           xf86-video-neomagic      \
           xf86-video-newport       \
           xf86-video-nouveau       \
           xf86-video-nv            \
           xf86-video-omap          \
           xf86-video-openchrome    \
           xf86-video-r128          \
           xf86-video-rendition     \
           xf86-video-s3            \
           xf86-video-s3virge       \
           xf86-video-savage        \
           xf86-video-siliconmotion \
           xf86-video-sis           \
           xf86-video-sisusb        \
           xf86-video-suncg6        \
           xf86-video-sunffb        \
           xf86-video-tdfx          \
           xf86-video-tga           \
           xf86-video-trident       \
           xf86-video-tseng         \
           xf86-video-v4l           \
           xf86-video-vesa          \
           xf86-video-vmware        \
           xf86-video-voodoo        \
           xf86-video-wsfb          \
           xf86-video-xgi           \
           xf86-video-xgixp


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
