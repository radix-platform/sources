#
# Project Home:
# ============
# https://pip.pypa.io
#
# Downloads:
# =========
# https://pypi.python.org/pypi/pip
# https://github.com/pypa/pip/releases
#
# GitGub:
# =========
# https://github.com/pypa/pip.git
#

url         = https://github.com/pypa/pip.git

repo_name   = pip

versions    = 7.1.2 8.1.1 9.0.1 19.2.3
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
	@if [ "$(url)" = 'git://radix.pro' ]; then \
	   git clone $(url)/$(repo_name).git $(repo_name) ; \
	 else \
	   git clone $(url) $(repo_name) ; \
	 fi
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
