
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := encodings                       \
           font-adobe-100dpi               \
           font-adobe-75dpi                \
           font-adobe-utopia-100dpi        \
           font-adobe-utopia-75dpi         \
           font-adobe-utopia-type1         \
           font-alias                      \
           font-arabic-misc                \
           font-bh-100dpi                  \
           font-bh-75dpi                   \
           font-bh-lucidatypewriter-100dpi \
           font-bh-lucidatypewriter-75dpi  \
           font-bh-ttf                     \
           font-bh-type1                   \
           font-bitstream-100dpi           \
           font-bitstream-75dpi            \
           font-bitstream-speedo           \
           font-bitstream-type1            \
           font-cronyx-cyrillic            \
           font-cursor-misc                \
           font-daewoo-misc                \
           font-dec-misc                   \
           font-ibm-type1                  \
           font-isas-misc                  \
           font-jis-misc                   \
           font-micro-misc                 \
           font-misc-cyrillic              \
           font-misc-ethiopic              \
           font-misc-meltho                \
           font-misc-misc                  \
           font-mutt-misc                  \
           font-schumacher-misc            \
           font-screen-cyrillic            \
           font-sony-misc                  \
           font-sun-misc                   \
           font-util                       \
           font-winitzki-cyrillic          \
           font-xfree86-type1


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
