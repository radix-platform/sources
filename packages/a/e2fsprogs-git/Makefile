#
# Project Home:
# ============
#   http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git
#
# Git:
#   http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git
#
# Gitweb:
#   http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git
#
# Clone:
# =====
#   git clone http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git
#

url        = http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git

repo_name  = e2fsprogs

versions   = 1.42.8 1.42.9

# List of tags to be extracted:
TAGS       = $(addprefix v, $(versions))

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
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
	@for version in $(versions) ; do \
	  tag=v`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  tar xjf $(repo_name)-$$version.tar.bz2 ; \
	  ( cd $(repo_name)-$$version ; autoreconf -i ; rm -rf autom4te.cache ) ; \
	  tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
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
