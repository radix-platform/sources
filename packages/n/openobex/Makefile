#
# Project Home:
# ============
# http://dev.zuckschwerdt.org/openobex
#
# GitHub:
# ======
# https://github.com/zuckschwerdt/openobex
# clone https://github.com/zuckschwerdt/openobex.git
#
# Downloads:
# =========
# http://dev.zuckschwerdt.org/openobex/wiki/ObexDownloads
#

url          = https://github.com/zuckschwerdt/openobex.git

repo_name    = openobex

versions     = 1.4 1.5
pkgname      = openobex
suffix       = tar.bz2

TAGS         = $(versions)
git_repo     = .git_clone
tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

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
	@for version in $(versions) ; do \
	  tag=`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xjf $(repo_name)-$$version.$(suffix) ; \
	  ( cd $(repo_name)-$$version ; ./bootstrap ; rm -rf autom4te.cache ) ; \
	  tar cjf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
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
