
#
# Omap 3/4 development platfrom u-boot:
# ====================================
#
# clone:
#   $ git clone git://git.omapzoom.org/repo/u-boot.git
#

url        = git://radix.pro/TI/omap5

repo_name  = u-boot-omap

#
# List of tags to be extracted:
# ============================
#
# Revisions used for OMAP5 & DRA7xx GLSDK
#
# revision '32166d3e764799cb27e4cf9c5e75e4019d1062e1' used by GLSDK 7_03_00_03
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions  = 32166d3e764799cb27e4cf9c5e75e4019d1062e1:2014.07:20151209

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), \
               $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, \
               $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .tar.xz, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone Texas Omap 3/4 $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision | cut -f 3 -d ':'`    ; \
	  if [ ! -f $(repo_name)-$$version-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version-$$date/ $$hash | \
	      xz >../$(repo_name)-$$version-$$date.tar.xz ) ; \
	  fi ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
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
