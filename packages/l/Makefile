
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := aalib                \
           cairo                \
           cracklib             \
           cracklib-words       \
           dbus-glib            \
           dbus-python          \
           elfutils             \
           expat                \
           freetype             \
           gamin                \
           gc                   \
           giflib               \
           harfbuzz             \
           icu4c                \
           isl                  \
           json-c               \
           keyutils             \
           lcms2                \
           liba52               \
           libarchive           \
           libcap               \
           libdatrie            \
           libelf               \
           libevent             \
           libffi               \
           libgphoto2           \
           libjpeg              \
           libjpeg-6a           \
           libjpeg-turbo        \
           libmng               \
           libpipeline          \
           libpng               \
           libspectre           \
           libthai              \
           libtiff              \
           libusb               \
           libusb-compat        \
           libvisual            \
           libxml2              \
           libxslt              \
           lzo                  \
           netpbm               \
           netpbm-doc           \
           netpbm-super-stable  \
           pcre                 \
           poppler              \
           poppler-data         \
           popt                 \
           ppl                  \
           sg3_utils            \
           shared-mime-info     \
           slang                \
           termcap-compat       \
           zlib


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
