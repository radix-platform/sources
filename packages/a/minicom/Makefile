#
# Project Home:
# ============
# https://alioth.debian.org/projects/minicom
#
# Mercurial HG clone:
# ==================
# hg clone https://alioth.debian.org/anonscm/hg/minicom
#

url        = https://alioth.debian.org/anonscm/hg

repo_name  = minicom
hg_repo    = .hg_clone

versions   = 2.6.2 2.7

tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(hg_repo):
	@echo -e "\n======= Clone $(repo_name) repository =======\n"
	@rm -rf $(repo_name)
	@hg clone -b default $(url)/$(repo_name) $(repo_name) 2>/dev/null
	@touch $@

$(tarballs): $(hg_repo)
	@for version in $(versions) ; do \
	  tag=v`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      hg archive --type tar --prefix $(repo_name)-$$version --rev $$tag - | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  tar xjf $(repo_name)-$$version.tar.bz2 ; \
	  ( cd $(repo_name)-$$version ; \
	    aclocal    2>/dev/null ; \
	    autoheader 2>/dev/null ; \
	    automake --add-missing --force --gnu --copy 2>/dev/null ; \
	    autoconf   2>/dev/null ; \
	    rm -rf autom4te.cache ) ; \
	  tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name) repository =======\n"
	@rm -rf $(hg_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(hg_repo) $(repo_name)
