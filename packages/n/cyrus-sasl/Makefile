#
# Project Home:
# ============
# https://www.cyrusimap.org
#
# Github:
# ======
# git clone https://github.com/cyrusimap/cyrus-sasl.git
#
# Downloads:
# =========
# https://github.com/cyrusimap/cyrus-sasl/releases
#

url        = https://github.com/cyrusimap

repo_name  = cyrus-sasl
pkg_name   = cyrus-sasl
suffix     = tar.xz

#
# List of revisions to be extracted:
# =================================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 0189425cc210555c36383293c468df5da73acc48:2.1.27

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
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
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(pkg_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkg_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$hash | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; \
	    NOCONFIGURE=yes ./autogen.sh ; \
	    rm -rf autom4te.cache .gitignore .travis.yml ; \
	    find . -type f -name '.gitignore' -exec rm -f {} \; ; \
	    find . -type f -name '.cvsignore' -exec rm -f {} \; ) ; \
	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version ; \
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
