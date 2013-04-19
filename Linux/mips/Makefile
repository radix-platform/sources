
#
# MIPS Linux Kernel: http://processors.wiki.ti.com/index.php/DaVinci_GIT_Linux_Kernel
#

#url        = git://git.linux-mips.org/pub/scm/ralf
url        = git://radix.pro

repo_name  = linux-mips

#
# List of tags to be extracted:
#
TAGS       = linux-2.6.31
TAGS      += linux-2.6.31.12
TAGS      += linux-2.6.36
TAGS      += linux-3.8.5

#
# Default Linux config file name:
#
_defconfig = bcm47xx_defconfig

git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\(.*\)/\2/'))
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
	   git clone $(url)/linux.git $(repo_name) ; \
	 fi
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-zA-Z-]*\)\([0-9][.0-9]*[.0-9]*\)\(.*\)/\2/'` ; \
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
	            linux-$$version/arch/mips/configs/$(_defconfig) && \
	   cp linux-$$version/arch/mips/configs/$(_defconfig) linux-$$version.defconfig && \
	   rm -rf linux-$$version ) ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculate '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(defconfigs) $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(defconfigs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
