
#
# SUNXI Linux Kernel: https://github.com/linux-sunxi/linux-sunxi
#

url        = git://radix.pro

repo_name  = linux-sunxi

#
# List of tags to be extracted:
#
TAGS       = sunxi-v3.0.52-r2
TAGS      += sunxi-v3.0.57-r2
TAGS      += sunxi-v3.0.76-r0
TAGS      += sunxi-v3.4.43-r0

#
# Default Linux config file name:
#
_defconfig = sun4i_defconfig

git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*-r[.0-9]\)\(.*\)/\2/'))
tarballs   = $(addsuffix .tar.bz2, $(addprefix linux-, $(versions)))
defconfigs = $(addsuffix .defconfig, $(addprefix linux-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@if [ "$(url)" = 'git://radix.pro' ]; then \
	   git clone $(url)/$(repo_name).git $(repo_name) ; \
	 else \
	   git clone $(url)/linux-sunxi.git $(repo_name) ; \
	 fi
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*-r[.0-9]\)\(.*\)/\2/'` ; \
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
