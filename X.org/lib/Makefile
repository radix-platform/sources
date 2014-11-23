
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := libAppleWM    \
           libFS         \
           libICE        \
           libSM         \
           libWindowsWM  \
           libX11        \
           libXScrnSaver \
           libXau        \
           libXaw        \
           libXaw3d      \
           libXcm        \
           libXcomposite \
           libXcursor    \
           libXdamage    \
           libXdmcp      \
           libXevie      \
           libXext       \
           libXfixes     \
           libXfont      \
           libXfontcache \
           libXft        \
           libXi         \
           libXinerama   \
           libXmu        \
           libXp         \
           libXpm        \
           libXrandr     \
           libXrender    \
           libXres       \
           libXt         \
           libXtst       \
           libXv         \
           libXvMC       \
           libXxf86dga   \
           libXxf86misc  \
           libXxf86vm    \
           libdmx        \
           libfontenc    \
           libpciaccess  \
           libxkbfile    \
           pixman        \
           xtrans


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
