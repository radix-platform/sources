#
# Project Home:
# ============
#   https://git.fedorahosted.org/git/initscripts.git
#
# Clone:
# =====
#   git clone git://git.fedorahosted.org/initscripts.git initscripts
#

url        = git://radix.pro/fedora

repo_name  = initscripts

#
# List of tags to be extracted:
#
TAGS       = r8-53
TAGS      += r8-54


git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/r//g' | sed 's/\-/./g'))
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
tarballs  += $(addsuffix .tar.bz2, $(addprefix function-src-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@if [ "$(url)" = 'git://radix.pro/fedora' ]; then \
	   git clone $(url)/$(repo_name).git $(repo_name) ; \
	 else \
	   git clone $(url) $(repo_name) ; \
	 fi
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/r//g' | sed 's/\-/./g'` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  tar xjf $(repo_name)-$$version.tar.bz2 ; \
	  mkdir -p function-src-$$version/rc.d/init.d ; \
	  ( cd $(repo_name)-$$version/src ; \
	    for file in consoletype.1 consoletype.c fstab-decode.8 fstab-decode.c \
	                initlog.1 initlog.c initlog.h process.c process.h usleep.1 usleep.c ; do \
	      cp -a $$file ../../function-src-$$version ; \
	    done ; \
	    cp -a ../rc.d/init.d/functions ../../function-src-$$version/rc.d/init.d ; \
	  ) ; \
	  tar cjf function-src-$$version.tar.bz2 function-src-$$version ; \
	  rm -rf $(repo_name)-$$version function-src-$$version ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
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
