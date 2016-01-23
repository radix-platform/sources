
#
# https://github.com/vim
#

url        = https://github.com/vim

repo_name  = vim

#
# List of tags to be extracted:
# ============================
#
#                                               hash | v | maintenance
#            ----------------------------------------+----------------
revisions  = 64922b9014765a41bb09e8612433a2a61918af6e-7.4-1155
revisions  = 2dedb45260604911035cff2364aca90a69156ed9-7.4-1156

git_repo   = .git_clone

pkgname    = vim
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2,3 -d '-'))
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
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  version=`echo $$revision | cut -f 2,3 -d '-'` ; \
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
