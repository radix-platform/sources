
#
# sunxi-tools:
# ===========
#
# clone:
#   $ git clone git://github.com/linux-sunxi/sunxi-tools
#

url        = git://radix.pro

repo_name  = sunxi-tools

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'autotools' branch used for A10, A20, ...
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 02a34738bcd7bbe7bb2131e6ce338565ab81d775-20140602


git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))

tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
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
	  date=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(repo_name)-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$date/ $$hash | \
	      bzip2 >../$(repo_name)-$$date.tar.bz2 ) ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
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
