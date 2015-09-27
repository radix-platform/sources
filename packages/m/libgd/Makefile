#
# Project Home:
# ============
# http://www.libgd.org
#
# Git:
# ===
# https://github.com/libgd/libgd.git
#
# Downloads:
# =========
# https://github.com/libgd/libgd/archive
#

url         = https://github.com/libgd/libgd.git

repo_name   = libgd
#
# List of tags to be extracted:
#
TAGS       = 9f0a7e7f4f0fb16d1d7936f2837a2559237edde9:2.1.0
TAGS      += 2912c0a2e0a246318f41bf1997f34ce1dc3e5e42:2.1.1

suffix     = tar.xz

git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | cut -f 2 -d ':'))
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
	  version=`echo $$tag | cut -f 2 -d ':'` ; \
	  hash=`echo $$tag | cut -f 1 -d ':'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	   tar xJf $(repo_name)-$$version.$(suffix) ; \
	   ( cd $(repo_name)-$$version ; ./bootstrap.sh ; rm -rf autom4te.cache ) ; \
	   tar cJf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	   rm -rf $(repo_name)-$$version ; \
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
