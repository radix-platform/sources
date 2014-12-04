
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := applewmproto     \
           bigreqsproto     \
           compositeproto   \
           damageproto      \
           dmxproto         \
           dri2proto        \
           dri3proto        \
           evieext          \
           fixesproto       \
           fontcacheproto   \
           fontsproto       \
           glproto          \
           inputproto       \
           kbproto          \
           presentproto     \
           printproto       \
           randrproto       \
           recordproto      \
           renderproto      \
           resourceproto    \
           scrnsaverproto   \
           videoproto       \
           windowswmproto   \
           xcmiscproto      \
           xextproto        \
           xf86bigfontproto \
           xf86dgaproto     \
           xf86driproto     \
           xf86miscproto    \
           xf86vidmodeproto \
           xineramaproto    \
           xproto


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
