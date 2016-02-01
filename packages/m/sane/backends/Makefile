#
# Project Home:
# ============
# http://www.sane-project.org
#
# Downloads:
# =========
# https://alioth.debian.org/frs/?group_id=30186
#
# Source tree:
# ===========
# https://anonscm.debian.org/git/sane/sane-backends.git
# ( https://alioth.debian.org/anonscm/git/sane/sane-backends.git )
#
# CHECKOUT:
# ========
# git clone https://anonscm.debian.org/git/sane/sane-backends.git
# git clone git://anonscm.debian.org/sane/sane-backends.git
# git clone ssh://git.debian.org/git/sane/sane-backends.git
#
# ( git clone https://alioth.debian.org/anonscm/git/sane/sane-backends.git )
#

url         = https://anonscm.debian.org/git/sane

repo_name  = sane-backends

# List of tags to be extracted:
TAGS       = RELEASE_1_0_24 RELEASE_1_0_25

versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | cut -f 2,3,4 -d '_' | sed 's,_,\.,g'))

git_repo   = .git_clone

suffix     = tar.bz2
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
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | cut -f 2,3,4 -d '_' | sed 's,_,\.,g'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ) ; \
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
