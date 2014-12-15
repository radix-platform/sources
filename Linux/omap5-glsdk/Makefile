
#
# OMAP (Android) Linux Kernel: http://git.omapzoom.org/kernel/omap.git
#

url        = git://radix.pro/TI/omap5

repo_name  = linux-omap

#
# List of tags to be extracted:
# ============================
#
# Revisions from p-ti-glsdk-3.8.y branch used for OMAP5 GLSDK
#
# revision '89927f5573872cada07d07c714e24a71ed6c29c3' used by GLSDK 6_03_00_01
# revision '2c871a879dbb4234232126f7075468d5bf0a50e3' used by GLSDK 6_04_00_02
#
# other revisions are taken when the remote-tracking branch
#   'origin/p-ti-linux-3.8.y' is merged into p-ti-glsdk-3.8.y
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 89927f5573872cada07d07c714e24a71ed6c29c3-20131223
revisions += 23cdd7ea36f5acf2b57032421586e8e8e76a490c-20140222
revisions += 2c871a879dbb4234232126f7075468d5bf0a50e3-20140411
revisions += 71a6fd5e2225306708ee3a7b941455d1315d1b9f-20140522
revisions += 6f5ad9c4a5760372995ddfe21e71e76e734d154f-20140724

#
# Default Linux config file name:
#
_defconfig = omap2plus_defconfig

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix glsdk-3.8.y-, $(shell echo $(tag) | cut -f 2 -d '-')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix linux-, $(versions)))
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
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  date=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f linux-glsdk-3.8.y-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'linux-glsdk-3.8.y-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-glsdk-3.8.y-$$date/ $$hash | \
	      bzip2 >../linux-glsdk-3.8.y-$$date.tar.bz2 ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.bz2
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(-\)\([a-zA-z]*-[0-9].[0-9].[a-z]-[0-9]*\)\(.tar.bz2\)/\3/'` ; \
	  defcfg=$(_defconfig) ; \
	  echo -e "\n======= Extracting default '.config' from '$$arch' tarball =======" ; \
	  ( tar -xjf $$arch \
	            linux-$$version/arch/arm/configs/$$defcfg && \
	   cp linux-$$version/arch/arm/configs/$$defcfg linux-$$version.defconfig && \
	   rm -rf linux-$$version ) ; \
	done
	@chmod a-x *.defconfig

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
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
