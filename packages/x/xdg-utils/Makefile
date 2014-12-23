#
# Project Home:
# ============
# http://cgit.freedesktop.org/xdg/xdg-utils
#
# cGit:
# ====
# http://cgit.freedesktop.org/xdg/xdg-utils
#
# Clone:
# =====
# git clone git://anongit.freedesktop.org/xdg/xdg-utils
# git clone http://anongit.freedesktop.org/git/xdg/xdg-utils.git
#

url        = git://anongit.freedesktop.org/git/xdg/xdg-utils

repo_name  = xdg-utils

#
# List of tags to be extracted:
#
TAGS       = 1.0.2
TAGS      += 1.1.0-rc2

suffix     = tar.xz

git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag)))
tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
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
	   git clone $(url) $(repo_name) ; \
	 fi
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ v$$tag | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
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
