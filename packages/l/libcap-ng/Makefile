#
# Project Home:
# ============
# https://people.redhat.com/sgrubb/libcap-ng
#
# GitHub:
# ======
# https://github.com/stevegrubb/libcap-ng
#
# Clone:
# =====
# https://github.com/stevegrubb/libcap-ng.git
#

url        = https://github.com/stevegrubb

repo_name  = libcap-ng

#
# List of tags to be extracted:
# ============================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = daaf0ad855e80b2ecf806ea4946817bfe6df2be4:0.7.10
revisions += d567fd5099ef7c157f8a1864bf77a3ae9a259232:0.8.2

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
	  hash=`echo $$revision    | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(repo_name)-$$version.$(suffix) ; \
	  ( cd $(repo_name)-$$version ; ./autogen.sh ; rm -rf autom4te.cache ) ; \
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
