
#
# Amlogic S805 Linux Kernel: https://github.com/hardkernel/linux.git
#

url        = git://radix.pro/Hardkernel/linux

repo_name  = linux

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'odroidc-3.10.y' branch used for Amlogic S805 devices.
#
#                                               hash |   snapshot | date
#            ----------------------------------------+------------+--------
revisions  = c8cd7397fca55ec03252e9e3a892dc489915bf90:aml-3.10.103:20160830

#
# Default Linux config file name:
#
_defconfig = odroidc_defconfig

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, $(shell echo $(tag) | cut -f 3 -d ':')))

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
	  hash=`echo $$revision     | cut -f 1 -d ':'` ; \
	  snapshot=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision     | cut -f 3 -d ':'` ; \
	  if [ ! -f linux-$$snapshot-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating 'linux-$$snapshot-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$$snapshot-$$date/ $$hash | \
	      xz >../linux-$$snapshot-$$date.tar.xz ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.xz
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-Z]*\)\(-\)\([a-zA-z0-9]*-[0-9][.0-9]*-[0-9]*\)\(.tar.xz\)/\3/'` ; \
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
