#
# Project Home:
# ============
# https://gitlab.com/m2crypto/m2crypto
#
# Downloads:
# =========
# https://pypi.org/project/M2Crypto/#files
#
# GitLab:
# ======
# https://gitlab.com/m2crypto/m2crypto.git
#

url         = https://gitlab.com/m2crypto/m2crypto.git

repo_name   = m2crypto

versions    = 0.38.0
suffix      = tar.gz

TAGS        = $(versions)

git_repo    = .git_clone
tarballs    = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url) $(repo_name)
	@touch $@


$(tarballs): $(git_repo)
	@for version in $(TAGS) ; do \
	  tag=`echo $$version`; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      gzip >../$(repo_name)-$$version.$(suffix) ) ; \
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
