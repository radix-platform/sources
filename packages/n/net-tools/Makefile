#
# Project Home:
# ============
#   http://www.linuxfoundation.org/collaborate/workgroups/networking/net-tools
#   http://sourceforge.net/projects/net-tools/files/
#
# Downloads:
# =========
#   http://sourceforge.net/projects/net-tools/files/
#
# Clone:
# =====
#   git clone git://git.code.sf.net/p/net-tools/code net-tools-code
#

url        = git://radix.pro

repo_name  = net-tools

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'master' branch
#
# revision '68a4d784daaf5fb3449808e434e8cbb9625988e6' commited at 2014-02-18
#
#                                               hash | date
#            ----------------------------------------+--------
revisions += 68a4d784daaf5fb3449808e434e8cbb9625988e6-20140218

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix 1.60-, $(shell echo $(tag) | cut -f 2 -d '-')))

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
	  if [ ! -f $(repo_name)-1.60-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-1.60-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-1.60-$$date/ $$hash | \
	      bzip2 >../$(repo_name)-1.60-$$date.tar.bz2 ) ; \
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
