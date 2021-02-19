#
# Project Home:
# ============
# http://check.sourceforge.net (has moved to):
# http://libcheck.github.io/check
#
# GitHub:
# ======
# https://github.com/libcheck/check
#
# Downloads:
# =========
# http://sourceforge.net/projects/check/files/check/$(VERSION) (has moved to:)
# https://github.com/libcheck/check/releases
#

url         = https://github.com/libcheck/check.git

repo_name   = check

versions    = 0.10.0 0.13.0 0.15.2
suffix      = tar.xz

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
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(repo_name)-$$version.$(suffix) ; \
	  ( cd $(repo_name)-$$version ; autoreconf -i ; rm -rf autom4te.cache .cvsignore .gitignore ) ; \
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
