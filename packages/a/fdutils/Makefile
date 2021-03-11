#
# Project Home:
# ============
# https://fdutils.linux.lu
#
# Downloads:
# =========
# https://fdutils.linux.lu/download.html
#

url          = https://fdutils.linux.lu

versions     = 5.5 5.6
pkgname      = fdutils
suffix       = tar.gz

tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))
descriptions = $(addsuffix .lsm, $(addprefix $(pkgname)-, $(versions)))

patch        = $(addsuffix -20081027.diff.gz, $(addprefix $(pkgname)-, 5.5))

files       = $(patch) $(descriptions)

all: $(tarballs) $(files) $(sha1s)

.PHONY: downloads_clean


$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(files): $(tarballs)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(files) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(files) $(sha1s)
