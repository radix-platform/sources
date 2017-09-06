#
# Project Home:
# ============
#   https://git.kernel.org/pub/scm/fs/xfs/xfsdump-dev.git
#
# Clone:
# =====
#   git clone git://git.kernel.org/pub/scm/fs/xfs/xfsdump-dev.git
#

url        = git://git.kernel.org/pub/scm/fs/xfs/xfsdump-dev.git

repo_name  = xfsdump

versions   = 3.1.7

# List of tags to be extracted:
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
	  tag=v`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      xz >../$(repo_name)-$$version.tar.xz ) ; \
	  fi ; \
	  tar xJf $(repo_name)-$$version.tar.xz ; \
	  ( cd $(repo_name)-$$version ; touch .gitcensus ; \
	    ./release.sh ; make distclean; rm -rf autom4te.cache $(repo_name)-$$version.tar.gz .gitignore ) ; \
	  tar cJf $(repo_name)-$$version.tar.xz $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
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
