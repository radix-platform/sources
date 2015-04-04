libUMP_la_CFLAGS = -I$(top_srcdir)/include

lib_LTLIBRARIES = libUMP.la
libUMP_la_LDFLAGS = -version-info @LIBUMP_VERSION_MAJOR@
libUMP_la_LIBADD = @LIBS@
libUMP_la_SOURCES = \
	ump_arch.c \
	ump_frontend.c \
	ump_osu_locks.c \
	ump_osu_memory.c \
	ump_ref_drv.c \
	ump_uku.c

library_includedir=$(includedir)/ump/
library_include_HEADERS = $(top_srcdir)/include/ump/ump.h          \
                          $(top_srcdir)/include/ump/ump_debug.h    \
                          $(top_srcdir)/include/ump/ump_osu.h      \
                          $(top_srcdir)/include/ump/ump_platform.h \
                          $(top_srcdir)/include/ump/ump_ref_drv.h  \
                          $(top_srcdir)/include/ump/ump_uk_types.h
