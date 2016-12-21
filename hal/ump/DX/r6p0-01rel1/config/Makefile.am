SUBDIRS = src

pkgconfigdir=$(libdir)/pkgconfig
pkgconfig_DATA=libump.pc

EXTRA_DIST = src/ump_arch.h     \
             src/ump_internal.h \
             src/ump_ioctl.h    \
             src/ump_uku.h

$(pkgconfig_DATA): libump.pc.in
