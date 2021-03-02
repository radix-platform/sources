#
# Project Home:
# ============
# https://github.com/shadow-maint/shadow
#
# Downloads:
# =========
# https://github.com/shadow-maint/shadow/releases
#


url        = https://github.com/shadow-maint

repo_name  = shadow

#
# List of upstream versions to be extracted:
# =========================================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = 2cc7da6058152ec0cd338d4e15d29bd7124ae3d7:4.8.1

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
	    tar xJf $(repo_name)-$$version.$(suffix) ; \
	    ( cd $(repo_name)-$$version ; autoreconf -v -f --install ; rm -rf autom4te.cache .gitignore .travis.yml ) ; \
	    tar cJf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	    rm -rf $(repo_name)-$$version ; \
	  fi ; \
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
