#
# Project Home:
# ============
# https://digip.org/jansson
#
# GitHub:
# ======
# https://github.com/akheron/jansson
#
#

url        = https://github.com/akheron

repo_name  = jansson
pkg_name   = jansson

#
# List of tags to be extracted:
# ============================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = e9ebfa7e77a6bee77df44e096b100e7131044059:2.13.1

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
	  if [ ! -f $(pkg_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkg_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$hash | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; \
	    autoreconf -vif ; rm -rf autom4te.cache .clang-format .gitignore .travis.yml ) ; \
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
