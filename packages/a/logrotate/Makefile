#
# Project Home:
# ============
# https://github.com/logrotate/logrotate
#
# Git:
# ===
# https://github.com/logrotate/logrotate.git
#
# Downloads:
# =========
# https://github.com/logrotate/logrotate/releases/...
#

url        = https://github.com/logrotate

repo_name  = logrotate

#
# List of tags to be extracted:
# ============================
#
#                                               hash | tag
#            ----------------------------------------+--------
revisions  = 35f99041bd8b68a89fc314d9dedaf18aa9c5743a:3.15.1

git_repo   = .git_clone

pkgname    = sysvinit
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
	  if [ ! -f $(pkgname)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkgname)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkgname)-$$version/ $$hash | \
	      xz >../$(pkgname)-$$version.$(suffix) ) ; \
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
