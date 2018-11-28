
#
# Rockchip Linux Kernel: https://github.com/rockchip-linux/kernel
#

url        = git://radix.pro/Rockchip/linux

repo_name  = kernel

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'release-4.4' branch used for RK3036, RK3066, RK312X, RK3188, RK322X,RK3288, RK3328, RK3368, RK3399, PX30.
#
#                                               hash | version
#            ----------------------------------------+----------------
revisions  = 0407701328f71606404770802ebf59dcb47494ac:4.4.154-20181101

#
# Default Linux config file name:
#
_defconfig = rockchip_linux_defconfig

git_repo   = .git_clone

vendor     = rk
versions   = $(foreach tag, $(revisions), $(addprefix $(vendor)-, $(shell echo $(tag) | cut -f 2 -d ':')))

tarballs   = $(addsuffix .tar.xz, $(addprefix linux-, $(versions)))
arm_defconfigs   = $(addsuffix .arm.defconfig, $(addprefix linux-, $(versions)))
arm64_defconfigs = $(addsuffix .arm64.defconfig, $(addprefix linux-, $(versions)))
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
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  date=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f linux-$(vendor)-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating 'linux-$(vendor)-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$(vendor)-$$date/ $$hash | \
	      xz >../linux-$(vendor)-$$date.tar.xz ) ; \
	  fi ; \
	done

$(arm_defconfigs): %.arm.defconfig: %.tar.xz
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(\-\)\([a-zA-z]*\-[0-9]\.[0-9]*\.[0-9]*-[0-9]*\)\(\.tar\.xz\)/\3/'` ; \
	  defcfg=$(_defconfig) ; \
	  echo -e "\n======= Extracting default arm '.config' from '$$arch' tarball =======" ; \
	  ( tar -xJf $$arch \
	            linux-$$version/arch/arm/configs/$$defcfg && \
	    cp linux-$$version/arch/arm/configs/$$defcfg linux-$$version.arm.defconfig     && \
	    rm -rf linux-$$version ) ; \
	done
	@chmod a-x *.arm.defconfig

$(arm64_defconfigs): %.arm64.defconfig: %.tar.xz
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(\-\)\([a-zA-z]*\-[0-9]\.[0-9]*\.[0-9]*\-[0-9]*\)\(\.tar\.xz\)/\3/'` ; \
	  defcfg=$(_defconfig) ; \
	  echo -e "\n======= Extracting default arm64 '.config' from '$$arch' tarball =======" ; \
	  ( tar -xJf $$arch \
	             linux-$$version/arch/arm64/configs/$$defcfg && \
	    cp linux-$$version/arch/arm64/configs/$$defcfg linux-$$version.arm64.defconfig && \
	    rm -rf linux-$$version ) ; \
	done
	@chmod a-x *.arm64.defconfig

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(arm_defconfigs) $(arm64_defconfigs) $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(arm_defconfigs) $(arm64_defconfigs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
