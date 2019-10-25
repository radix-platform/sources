# Project Home:
# ============
# http://xfs.org/index.php/Main_Page
#
# Downloads:
# =========
# http://xfs.org/index.php/Getting_the_latest_source_code
#
# Git:
# ===
# https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git
#

url        = https://git.kernel.org/pub/scm/fs/xfs

repo_name  = xfsprogs-dev
pkg_name   = xfsprogs
suffix     = tar.xz

versions   = 5.2.1

TAGS       = $(addprefix v, $(versions))

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
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; make configure ; rm -rf autom4te.cache .gitignore ) ; \
	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version ; \
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
