
#
# IRAM-loader
#

url        = git@radix.pro:/u3/scm/git

repo_name  = IRAM-loader

#
# List of tags to be extracted:
#
TAGS       = 0.0.1

git_repo   = .git_clone
# here version is equal to tag, but version variable is defined for case
# when tag name contains version as subctring [see /Lunux/dm644x/Makefile]
versions   = $(TAGS)
tarballs   = $(addsuffix .tar.bz2,$(addprefix $(repo_name)-,$(versions)))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository ======="
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=$$tag ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$version | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	done

repository_clean: $(tarballs)
	@echo -e "\n======= Remove $(repo_name).git repository ======="
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs)
