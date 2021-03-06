#
# Project Home:
# ============
# http://flex.sourceforge.net
#
# Downloads:
# =========
# http://sourceforge.net/projects/flex/files
#
#
# GitHub:
# ======
# https://github.com/westes/flex
#
# Clone:
# =====
# https://github.com/westes/flex.git
#

url        = https://github.com/westes

repo_name  = flex

#
# List of tags to be extracted:
# ============================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = 581ef6d17f7fccc9c538c0f0bda9b89df66c2dc3:2.6.3
revisions += ab49343b08c933e32de8de78132649f9560a3727:2.6.4

git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))

tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
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
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(repo_name)-$$version.$(suffix) ; \
	  ( cd $(repo_name)-$$version ; ./autogen.sh ; ./configure ; make ; make distclean ; rm -rf autom4te.cache .gitignore ) ; \
	  tar cJf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
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
