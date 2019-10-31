
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := aalib                \
           assimp               \
           boost                \
           botan                \
           cairo                \
           cracklib             \
           cracklib-words       \
           dbus-glib            \
           dbus-python          \
           elfutils             \
           expat                \
           fftw                 \
           freetype             \
           fribidi              \
           gamin                \
           gc                   \
           giflib               \
           harfbuzz             \
           hdf5                 \
           hwids                \
           hwloc                \
           icu4c                \
           ieee1394             \
           imlib                \
           imlib2               \
           isl                  \
           jemalloc             \
           json-c               \
           keyutils             \
           lcms2                \
           liba52               \
           libaio               \
           libarchive           \
           libasyncns           \
           libatomic_ops        \
           lincaca              \
           libcap               \
           libcap-ng            \
           libdatrie            \
           libedit              \
           libelf               \
           libevent             \
           libffi               \
           libgphoto2           \
           libical              \
           libieee1284          \
           libiodbc             \
           libjpeg              \
           libjpeg-6a           \
           libjpeg-turbo        \
           libmng               \
           libpipeline          \
           libpng               \
           libsodium            \
           libspectre           \
           libstrophe           \
           libssh               \
           libssh2              \
           libthai              \
           libtiff              \
           libunwind            \
           libusb               \
           libusb-compat        \
           libvisual            \
           libxml2              \
           libxslt              \
           log4cplus            \
           lz4                  \
           lzo                  \
           mozilla-nspr         \
           mozilla-nss          \
           netpbm               \
           netpbm-doc           \
           netpbm-super-stable  \
           openmpi              \
           pciids               \
           pcre                 \
           pcre2                \
           polkit               \
           poppler              \
           poppler-data         \
           popt                 \
           ppl                  \
           pycairo              \
           pycups               \
           pycurl               \
           pyrex                \
           sbc                  \
           sdl                  \
           sg3_utils            \
           shared-mime-info     \
           slang                \
           termcap-compat       \
           unidata              \
           usbids               \
           v4l-utils            \
           zeromq               \
           zlib                 \
           zstd


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
