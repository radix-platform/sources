#
# Project Home:
# ============
# https://dev.maxmind.com/geoip/geoip2/web-services
# https://dev.maxmind.com/maxmind-db
#
# Clone:
# =====
# git clone https://github.com/maxmind/libmaxminddb.git
#
# Downloads:
# =========
# https://github.com/maxmind/libmaxminddb/releases
#

url         = https://github.com/maxmind/libmaxminddb/releases/download

versions    = 1.4.2
pkg_name    = libmaxminddb
suffix      = tar.gz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	  wget -N $(url)/$$version/$(pkg_name)-$$version.$(suffix) ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
