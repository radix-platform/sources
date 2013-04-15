
#
# Davinci Linux Kernel: http://processors.wiki.ti.com/index.php/DaVinci_GIT_Linux_Kernel
#

#url        = git://gitorious.org/linux-davinci
url        = git://radix.pro

repo_name  = linux-davinci

#
# List of tags to be extracted:
#
TAGS       = v2.6.36-davinci1
TAGS      += v3.8-davinci2

#
# Default Linux config file name:
#
_defconfig = davinci_all_defconfig

git_repo   = .git_clone
versions   = $(foreach tag,$(TAGS),$(shell echo $(tag) | sed 's/\(^[a-zA-Z]*\)\([0-9][.0-9]*[.0-9]*\)\(.*\)/\2/'))
tarballs   = $(addsuffix .tar.bz2,$(addprefix linux-,$(versions)))
defconfigs = $(addsuffix .defconfig,$(addprefix linux-,$(versions)))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone Kevin Hilman $(repo_name).git repository ======="
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-zA-Z]*\)\([0-9][.0-9]*[.0-9]*\)\(.*\)/\2/'` ; \
	  if [ ! -f linux-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'linux-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$$version/ $$tag | \
	      bzip2 >../linux-$$version.tar.bz2 ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.bz2
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\([\.].*\)/\2/'` ; \
	  echo -e "\n======= Extracting default '.config' from '$$arch' tarball =======" ; \
	  ( tar -xjf $$arch \
	            linux-$$version/arch/arm/configs/$(_defconfig) && \
	   cp linux-$$version/arch/arm/configs/$(_defconfig) linux-$$version.defconfig && \
	   rm -rf linux-$$version ) ; \
	done

repository_clean: $(defconfigs)
	@echo -e "\n======= Remove cloned $(repo_name).git repository ======="
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(defconfigs)
	@rm -rf $(git_repo) $(repo_name)
