#
# Project Home:
# ============
# http://vi-improved.org
# http://www.vim.org
#
# Sources:
# =======
# http://www.vim.org/sources.php
#
# Mercurial HG:
# ============
# https://code.google.com/p/vim/source/browse
#
# Mercurial HG clone:
# ==================
# hg clone https://code.google.com/p/vim/
#
# Downloads:
# =========
# ftp://ftp.vim.org/pub/vim/unix
#

url        = https://code.google.com/p

repo_name  = vim

#
# List of tags to be extracted:
# ============================
#
#                   hash | tag
#            ------------+--------
revisions  = 359743c1f59a-v7-4-000
revisions += eb33cadafcab-v7-4-050
revisions += 353330c512a9-v7-4-373


hg_repo    = .hg_clone

versions   = $(foreach tag, $(revisions), \
               $(addprefix $(shell echo $(tag) | cut -f 2-3 -d '-' | sed 's,v,,' | sed 's,-,\.,')-, \
                 $(shell echo $(tag) | cut -f 4 -d '-')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix vim-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(hg_repo):
	@echo -e "\n======= Clone $(repo_name) repository =======\n"
	@rm -rf $(repo_name)
	@hg clone -b default $(url)/$(repo_name) $(repo_name)
	@touch $@

$(tarballs): $(hg_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  version=`echo $$revision | cut -f 2-3 -d '-' | sed 's,v,,' | sed 's,-,\.,'`-`echo $$revision | cut -f 4 -d '-'` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      hg archive --type tar --prefix $(repo_name)-$$version --rev $$hash - | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
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
