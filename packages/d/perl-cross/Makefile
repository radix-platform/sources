#
# Project Home:
# ============
#   https://github.com/arsv/perl-cross
#
# Git:
#   https://github.com/arsv/perl-cross.git
#
# Clone:
# =====
#   git clone https://github.com/arsv/perl-cross.git
#

url        = git://radix.pro

repo_name  = perl-cross

versions   = 1.2.2 1.2.3 1.3 1.3.3

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.xz, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

releases   = 5.22.1 5.26.1 5.28.1 5.30.0 5.30.2 5.31.3


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
	  tag=`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      xz >../$(repo_name)-$$version.tar.xz ) ; \
	  fi ; \
	  mkdir -p $$version ; \
	  tar -xJf $(repo_name)-$$version.tar.xz ; \
	  ( cd $(repo_name)-$$version && \
	    for release in $(releases) ; do \
	      rel=$(repo_name)-$$release.tar.xz ; \
	      tar -cJf ../$$version/$$rel \
	      --exclude README.md \
	      --exclude LICENSE   \
	      --exclude Artistic  \
	      --exclude Copying   \
	      --exclude 0pack.sh  \
	      --xform "s!^!perl-$$release/!" \
	      * ; \
	      ( cd ../$$version ; sha1sum --binary $$rel > $$rel.sha1sum ) ; \
	    done ) ; \
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
	@rm -rf $(tarballs) $(sha1s) $(versions)
	@rm -rf $(git_repo) $(repo_name)
