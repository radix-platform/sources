
#
# TI WiLink8 WLAN:
# ===============
#
# clone:
#   $ git clone git://git.ti.com/wilink8-wlan/wl18xx_fw.git
#

url        = git://radix.pro/TI/wilink8-wlan

repo_name  = wl18xx_fw

#
# List of tags to be extracted:
# ============================
#
# Revisions used for OMAP5 & DRA7xx GLSDK
#
# revision '02df01f8b9557b2cf920d14bdaaabde2373e3d7e' tag 8.5 used by GLSDK 7_03_00_03
#
#                                               hash |   version | date
#            ----------------------------------------+-----------+--------
revisions  = 02df01f8b9557b2cf920d14bdaaabde2373e3d7e:ol_r8.a9.22:20141126


git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), \
               $(shell echo $(tag) | cut -f 2 -d ':'))

tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone WiLink8 WLAN $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
