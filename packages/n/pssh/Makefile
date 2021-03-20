#
# Project Home:
# ============
# https://github.com/lilydjwg/pssh
#
# GitHub:
# ======
# git clone https://github.com/lilydjwg/pssh.git
#
# Downloads:
# =========
# https://github.com/lilydjwg/pssh/releases
#

url        = https://github.com/lilydjwg

repo_name  = pssh
pkg_name   = pssh
suffix     = tar.xz

versions   = 2.3.1 2.3.4

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.xz, $(addprefix $(pkg_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean


all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for version in $(versions) ; do \
	  tag=v`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$tag | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

#	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
#	  ( cd $(pkg_name)-$$version ; \
#	    autoreconf --warnings=portability -vif ; \
#	    rm -rf autom4te.cache .github .gitignore .travis.yml ) ; \
#	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
#	  rm -rf $(pkg_name)-$$version ; \

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
