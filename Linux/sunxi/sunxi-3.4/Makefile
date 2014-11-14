
#
# SUNXI Linux Kernel: https://github.com/linux-sunxi/linux-sunxi
#

url        = git://radix.pro

repo_name  = linux-sunxi

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'sunxi-3.4' branch used for A10, A13, A10s and A20.
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = e37d760b363888f3a65cd6455c99a75cac70a7b8-20140514
revisions += 9a1cd034181af628d4145202289e1993c1687db6-20141014

#
# Default Linux config file name:
#
_defconfig = sun7i_defconfig

git_repo   = .git_clone

branch     = sunxi-3.4
versions   = $(foreach tag, $(revisions), $(addprefix $(branch)-, $(shell echo $(tag) | cut -f 2 -d '-')))

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
	    echo -e "\n======= Creating 'linux-$(branch)-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$(branch)-$$date/ $$hash | \
	      bzip2 >../linux-$(branch)-$$date.tar.bz2 ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.bz2
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(-\)\([a-zA-z]*-[0-9].[0-9]-[0-9]*\)\(.tar.bz2\)/\3/'` ; \
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
