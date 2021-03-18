#
# Project Home:
# ============
#   https://github.com/linux-can/can-utils
#
# Clone:
# =====
#   git clone https://github.com/linux-can/can-utils.git
#

url        = https://github.com/linux-can

repo_name  = can-utils

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 791890542ac1ce99131f36435e72af5635afc2fa:0.0.1
revisions += eb66451df280f95a9a12e78b151b8d867e1b78ed:2020.12.0


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
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	    tar xJf $(repo_name)-$$version.$(suffix) ; \
	    ( cd $(repo_name)-$$version ; ./autogen.sh ; make distclean ; rm -rf autom4te.cache ) ; \
	    tar cJf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	    rm -rf $(repo_name)-$$version ; \
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
