
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := appres          \
           bdftopcf        \
           beforelight     \
           bitmap          \
           constype        \
           editres         \
           fonttosfnt      \
           fslsfonts       \
           fstobdf         \
           iceauth         \
           ico             \
           intel-gpu-tools \
           lbxproxy        \
           listres         \
           luit            \
           mkcomposecache  \
           mkfontdir       \
           mkfontscale     \
           oclock          \
           proxymngr       \
           rendercheck     \
           rgb             \
           rstart          \
           sessreg         \
           setxkbmap       \
           showfont        \
           smproxy         \
           transset        \
           twm             \
           viewres         \
           x11perf         \
           xauth           \
           xbacklight      \
           xbiff           \
           xcalc           \
           xclipboard      \
           xclock          \
           xcm             \
           xcmsdb          \
           xcompmgr        \
           xconsole        \
           xcursorgen      \
           xdbedizzy       \
           xditview        \
           xdm             \
           xdpyinfo        \
           xdriinfo        \
           xedit           \
           xev             \
           xeyes           \
           xf86dga         \
           xfd             \
           xfindproxy      \
           xfontsel        \
           xfs             \
           xfsinfo         \
           xfwp            \
           xgamma          \
           xgc             \
           xhost           \
           xinit           \
           xinput          \
           xkbcomp         \
           xkbevd          \
           xkbprint        \
           xkbutils        \
           xkill           \
           xload           \
           xlogo           \
           xlsatoms        \
           xlsclients      \
           xlsfonts        \
           xmag            \
           xman            \
           xmessage        \
           xmh             \
           xmodmap         \
           xmore           \
           xpr             \
           xprop           \
           xrandr          \
           xrdb            \
           xrefresh        \
           xscope          \
           xset            \
           xsetroot        \
           xsm             \
           xstdcmap        \
           xvidtune        \
           xvinfo          \
           xwd             \
           xwininfo        \
           xwud


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
