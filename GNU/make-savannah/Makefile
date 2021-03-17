#
# Project Home:
# ============
# https://www.gnu.org/software/make
#
# Git:
# ===
# http://git.savannah.gnu.org/cgit/make.git/
#
# Clone:
# =====
# git clone https://git.savannah.gnu.org/git/make.git
#

url        = https://git.savannah.gnu.org/git

repo_name  = make
pkg_name   = make

#
# List of upstream versions to be extracted:
# =========================================
#                                               hash | tag | gnulib revision
#            ----------------------------------------+-----+----------------------------------------
revisions  = c5319e75f5b64c972a38967a6eb5747838e914fd:4.3.1:363497c93a59235478cd80d536a17023e595cc79

git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))

tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
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
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision    | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  gnulib=`echo $$revision  | cut -f 3 -d ':'` ; \
	  if [ ! -f $(pkg_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkg_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$hash | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; \
	    sed -i "s,\[[0-9]\.[0-9]\.[0-9]*\],\[$$version\]," configure.ac ; \
	    GNULIB_REVISION=$$gnulib ./bootstrap --force --copy ; \
	    rm -rf autom4te.cache gl gnulib scripts .ccls .dir-locals.el ; \
	    find . -type f -name *~ -exec rm -f {} \; ; \
	    find . -type f -name '.gitignore' -exec rm -f {} \; ; \
	  ) ; \
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
