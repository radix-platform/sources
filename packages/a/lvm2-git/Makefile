#
# Project Home:
# ============
# http://sourceware.org/git/?p=lvm2.git
#
# Git:
# ===
# git://sourceware.org/git/lvm2.git
# ssh://sourceware.org/git/lvm2.git
# https://sourceware.org/git/lvm2.git
#

url        = git://sourceware.org/git/lvm2.git

repo_name  = LVM2

versions   = 2.02.186 2.03.06 2.03.11

TAGS       = $(addprefix v, $(versions))

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.xz, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean


all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url) $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for version in $(versions) ; do \
	  ver=`echo $$version | sed 's,\.,_,g'` ; \
	  tag=v`echo $$ver` ; \
	  if [ ! -f $(repo_name)-$$version.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      xz >../$(repo_name)-$$version.tar.xz ) ; \
	  fi ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
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
