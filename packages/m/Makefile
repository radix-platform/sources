
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := OpenMAX      \
           VideoLAN     \
           alsa         \
           amlogic      \
           amp          \
           amr          \
           audiocoding  \
           audiofile    \
           dcadec       \
           fb           \
           ffmpeg       \
           gsm          \
           jackaudio    \
           ladspa       \
           lame         \
           libass       \
           libav        \
           libdc1394    \
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
           mikmod       \
           moc          \
           mp4v2        \
           mpg123       \
           normalize    \
           opencv       \
           openh264     \
           openjpeg     \
           openjpeg2    \
           portaudio    \
           pulseaudio   \
           record       \
           rtmpdump     \
           sane         \
           schroedinger \
           smpeg        \
           soma         \
           sox          \
           taglib       \
           twolame      \
           vaapi        \
           vid-stab     \
           wavpack      \
           workbone     \
           x265         \
           xiph         \
           xvidcore     \
           zvbi


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
