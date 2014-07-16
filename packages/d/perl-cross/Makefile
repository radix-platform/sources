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

versions   = 0.8.5

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

releases   = 5.18.2 5.20.0


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
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  mkdir -p $$version ; \
	  tar -xjf $(repo_name)-$$version.tar.bz2 ; \
	  ( cd $(repo_name)-$$version && \
	    for release in $(releases) ; do \
	      rel=$(repo_name)-$$release.tar.bz2 ; \
	      tar -cjf ../$$version/$$rel \
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

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
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
