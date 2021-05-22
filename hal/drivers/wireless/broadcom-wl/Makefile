
#
# Broadcom wl: https://github.com/antoineco/broadcom-wl.git
#

url        = https://github.com/antoineco

repo_name  = broadcom-wl

#
# List of tags to be extracted:
# ============================
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 34633bb3c243eb060d33b144836d05b143517892:6.30.223.271

git_repo   = .git_clone

pkgname    = broadcom-wl
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
	  date=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(pkgname)-$$date.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkgname)-$$date.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkgname)-$$date/ $$hash | \
	      xz >../$(pkgname)-$$date.$(suffix) ) ; \
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
