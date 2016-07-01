
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := NetworkManager                 \
           adwaita-icon-theme             \
           at-spi2-atk                    \
           at-spi2-core                   \
           atk                            \
           atkmm                          \
           baobab                         \
           cantarell-fonts                \
           caribou                        \
           clutter                        \
           clutter-gst                    \
           clutter-gtk                    \
           cogl                           \
           dconf                          \
           empathy                        \
           eog                            \
           epiphany                       \
           esound                         \
           evince                         \
           evolution-data-server          \
           folks                          \
           gcr                            \
           gdk-pixbuf                     \
           gdm                            \
           geocode-glib                   \
           gjs                            \
           glib                           \
           glib-networking                \
           glib2                          \
           glibmm                         \
           gmime                          \
           gnome-backgrounds              \
           gnome-bluetooth                \
           gnome-calculator               \
           gnome-contacts                 \
           gnome-control-center           \
           gnome-desktop                  \
           gnome-dictionary               \
           gnome-disk-utility             \
           gnome-font-viewer              \
           gnome-keyring                  \
           gnome-menus                    \
           gnome-online-accounts          \
           gnome-online-miners            \
           gnome-packagekit               \
           gnome-screenshot               \
           gnome-session                  \
           gnome-settings-daemon          \
           gnome-shell                    \
           gnome-shell-extensions         \
           gnome-system-log               \
           gnome-system-monitor           \
           gnome-terminal                 \
           gnome-themes-standard          \
           gnome-user-docs                \
           gnome-user-share               \
           gnome-video-effects            \
           gobject-introspection          \
           grilo                          \
           grilo-plugins                  \
           gsettings-desktop-schemas      \
           gssdp                          \
           gtk+                           \
           gtk+2                          \
           gtk+3                          \
           gtk-doc                        \
           gtk-engines                    \
           gtkmm                          \
           gtksourceview                  \
           gucharmap                      \
           gupnp                          \
           gupnp-igd                      \
           gvfs                           \
           json-glib                      \
           libart_lgpl                    \
           libchamplain                   \
           libcroco                       \
           libgdata                       \
           libgee                         \
           libglade                       \
           libgnomekbd                    \
           libgsf                         \
           libgsystem                     \
           libgtop                        \
           libgudev                       \
           libgweather                    \
           libgxps                        \
           libmediaart                    \
           libnotify                      \
           libpeas                        \
           librsvg                        \
           libsecret                      \
           libsigc++                      \
           libsoup                        \
           libwnck                        \
           libzapojit                     \
           mm-common                      \
           mobile-broadband-provider-info \
           mousetweaks                    \
           mutter                         \
           nautilus                       \
           network-manager-applet         \
           pango                          \
           pangomm                        \
           pygobject                      \
           pygtk                          \
           rest                           \
           seed                           \
           sushi                          \
           totem                          \
           totem-pl-parser                \
           tracker                        \
           vala                           \
           vino                           \
           vte                            \
           yelp                           \
           yelp-tools                     \
           yelp-xsl                       \
           zenity


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
