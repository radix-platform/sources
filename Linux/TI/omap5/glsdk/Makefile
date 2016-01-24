
#
# OMAP (Android) Linux Kernel: http://git.omapzoom.org/kernel/omap.git
#

url        = git://radix.pro/TI/omap5

repo_name  = linux-omap

#
# List of tags to be extracted:
# ============================
#
# Revisions used for OMAP5 & DRA7xx GLSDK
#
# revision '84bfe0e20dd2593212cba68edfbd49a2b23b8975' used by GLSDK 7_03_00_03
#
#                                               hash | linux | date
#            ----------------------------------------+-------+---------
revisions  = 84bfe0e20dd2593212cba68edfbd49a2b23b8975:3.14.57:20151211

#
# Default Linux config file name:
#
_defconfig = omap2plus_defconfig

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), \
               $(addprefix glsdk-$(shell echo $(tag) | cut -f 2 -d ':')-, \
               $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .tar.xz, $(addprefix linux-, $(versions)))
defconfigs = $(addsuffix .defconfig, $(addprefix linux-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision | cut -f 3 -d ':'`    ; \
	  if [ ! -f linux-glsdk-$$version-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating 'linux-glsdk-$$version-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-glsdk-$$version-$$date/ $$hash | \
	      xz >../linux-glsdk-$$version-$$date.tar.xz ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.xz
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(-\)\([a-zA-z]*-[0-9]*.[0-9]*.[0-9]*-[0-9]*\)\(.tar.xz\)/\3/'` ; \
	  defcfg=$(_defconfig) ; \
	  echo -e "\n======= Extracting default '.config' from '$$arch' tarball =======" ; \
	  ( tar -xJf $$arch \
	            linux-$$version/arch/arm/configs/$$defcfg && \
	   cp linux-$$version/arch/arm/configs/$$defcfg linux-$$version.defconfig && \
	   rm -rf linux-$$version ) ; \
	done
	@chmod a-x *.defconfig

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(defconfigs) $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(defconfigs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
