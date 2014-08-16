#
# Project Home:
# ============
# http://www.portaudio.com
#
# Downloads:
# =========
# http://www.portaudio.com/download.html
# http://www.portaudio.com/archives
#

url         = http://www.portaudio.com/archives

versions    = v19_20140130
pkgname     = pa_stable
docname     = pa_stable_doxydocs
suffix      = tgz

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)_, $(versions)))
tarballs   += $(addsuffix .$(suffix), \
                $(addprefix $(docname)_, \
                  $(foreach version,$(versions),$(shell echo $(version) | cut -f 2 -d '_'))))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
