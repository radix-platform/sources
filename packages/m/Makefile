
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := OpenMAX      \
           VideoLAN     \
           alsa         \
           amp          \
           amr          \
           audiofile    \
           fb           \
           ffmpeg       \
           gsm          \
           jackaudio    \
           ladspa       \
           lame         \
           libass       \
           libav        \
           libdv        \
           libexif      \
           libgd        \
           libgphoto2   \
           libmodplug   \
           libsoxr      \
           libvdpau     \
           libvpx       \
           libwebp      \
           linuxaudio   \
           linuxtv      \
           mad          \
           mega-nerd    \
           moc          \
           mpg123       \
           normalize    \
           openjpeg     \
           openjpeg2    \
           portaudio    \
           record       \
           sane         \
           schroedinger \
           soma         \
           sox          \
           taglib       \
           vaapi        \
           wavpack      \
           workbone     \
           xiph         \
           xvidcore


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
