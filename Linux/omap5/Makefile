
#
# OMAP (Android) Linux Kernel: http://git.omapzoom.org/kernel/omap.git
#

#url        = git://git.omapzoom.org/kernel
url        = git://radix.pro

repo_name  = omap

#
# List of tags to be extracted:
#
TAGS       = android-3.4-5AJ.1.2
TAGS      += android-3.4-5AJ.1.3
TAGS      += android-3.4-5AJ.1.4
TAGS      += android-3.8-6AJ.1.0
TAGS      += android-3.8-6AJ.1.1
TAGS      += android-3.8-6AJ.1.1-RC0
TAGS      += android-3.8-6AJ.1.2-RC3

#
# Default Linux config file name:
#
_defconfig = android_omap_defconfig

git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-zA-z]*\)\(-\)\([0-9].[0-9]-[0-9][A-Z]*.[0-9]*.[0-9]*.*\)/\3/'))
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-zA-z]*\)\(-\)\([0-9].[0-9]-[0-9][A-Z]*.[0-9]*.[0-9]*.*\)/\3/'))

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
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-zA-z]*\)\(-\)\([0-9].[0-9]-[0-9][A-Z]*.[0-9]*.[0-9]*.*\)/\3/'` ; \
	  if [ ! -f linux-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'linux-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$$version/ $$tag | \
	      bzip2 >../linux-$$version.tar.bz2 ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.bz2
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-z]*\)\(-\)\([0-9].[0-9]-[0-9][A-Z]*.[0-9]*.[0-9]*.*\)\(.tar.bz2\)/\3/'` ; \
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
