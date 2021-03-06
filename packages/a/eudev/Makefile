#
# Project Home:
# ============
# http://www.gentoo.org/proj/en/eudev
#
# GitHub:
# ======
# https://github.com/gentoo/eudev
#
# Downloads:
# =========
# http://dev.gentoo.org/~blueness/eudev
#

url        = git://radix.pro/gentoo

repo_name  = eudev

#
# List of revisions to be extracted:
# =================================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 71ff5b6886946dacca8ae685ac85cdc174cfdece:3.1.5
revisions += d69f3f28348123ab7fa0ebac63ec2fd16800c5e0:3.2.8
revisions += 2ab887ec67afd15eb9b0849467f1f9c036a2b6c8:3.2.9
revisions += be7068512c7512fa67c64fbff3472ab140c277c8:3.2.10

git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))

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
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
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
