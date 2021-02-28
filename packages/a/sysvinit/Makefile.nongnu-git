#
# Project Home:
# ============
# http://savannah.nongnu.org/projects/sysvinit
#
# Git:
# ===
# http://git.savannah.nongnu.org/cgit/sysvinit.git
#
#  clone:
#  -----
#  git://git.savannah.gnu.org/sysvinit.git
#  https://git.savannah.gnu.org/git/sysvinit.git
#  ssh://git.savannah.gnu.org:/srv/git/sysvinit.git
#
# Downloads:
# =========
# http://download.savannah.gnu.org/releases/sysvinit/...
#

url        = https://git.savannah.gnu.org/git

repo_name  = sysvinit

#
# List of tags to be extracted:
# ============================
#
#                                               hash | tag
#            ----------------------------------------+--------
revisions  = 85c2c4064d68006bdb36a29fa457c646acadb4b1-2.88dsf
revisions += e02e001f7abd1b74c40a9756e6aac30a53b78800-2.89
revisions += 40f40a416662ea251dd29ad662a246e2a5399892-2.90
revisions += 5f96543c96b7dba53487e767fb68ddc143ca092f-2.95
# from branches:
revisions += 13cb3665b18eaca579dfa295df6e7dc0358db003-2.96
revisions += ad50c8272e2213150fbe958a8e425473b2cf70c0-2.97

git_repo   = .git_clone

pkgname    = sysvinit
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))
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
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
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
