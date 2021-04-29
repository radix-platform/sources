#
# Project Home:
# ============
# https://arthurdejong.org/nss-pam-ldapd
#
# Cgit:
# ====
# https://arthurdejong.org/git/nss-pam-ldapd
#
#

url        = https://arthurdejong.org/git

repo_name  = nss-pam-ldapd
pkg_name   = nss-pam-ldapd

#
# List of tags to be extracted:
# ============================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = d9710a242d5997c0f4abac5251a4ded44381c44b:0.9.11
#
# 0.9.11 is c4daf27eb3ec68bb9ec2a2779ed085f30e9d9b8e but we checkout latest at 2021-01-23
#

git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))

tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name) $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision    | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(pkg_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkg_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$hash | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

#	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
#	  ( cd $(pkg_name)-$$version ; \
#	    autoreconf -vif ; rm -rf autom4te.cache .clang-format .gitignore .travis.yml ) ; \
#	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
#	  rm -rf $(pkg_name)-$$version ; \

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
