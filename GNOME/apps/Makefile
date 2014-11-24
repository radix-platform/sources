
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := accerciser                 \
           aisleriot                  \
           anjuta                     \
           bijiben                    \
           brasero                    \
           cheese                     \
           devhelp                    \
           evolution                  \
           file-roller                \
           five-or-more               \
           four-in-a-row              \
           gedit                      \
           gitg                       \
           glade                      \
           gnome-boxes                \
           gnome-chess                \
           gnome-clocks               \
           gnome-color-manager        \
           gnome-devel-docs           \
           gnome-documents            \
           gnome-getting-started-docs \
           gnome-initial-setup        \
           gnome-klotski              \
           gnome-logs                 \
           gnome-mahjongg             \
           gnome-maps                 \
           gnome-mines                \
           gnome-music                \
           gnome-nettool              \
           gnome-nibbles              \
           gnome-photos               \
           gnome-robots               \
           gnome-software             \
           gnome-sound-recorder       \
           gnome-sudoku               \
           gnome-tetravex             \
           gnome-tweak-tool           \
           gnome-weather              \
           hitori                     \
           iagno                      \
           lightsoff                  \
           nautilus-sendto            \
           nemiver                    \
           orca                       \
           polari                     \
           quadrapassel               \
           rygel                      \
           seahorse                   \
           swell-foop                 \
           tali                       \
           vinagre


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
