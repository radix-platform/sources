
#
# xf86-video-fbturbo (Mali r6p1-01rel0)
# =====================================
#
# video driver, primarily optimized for the devices powered
# by the Allwinner SoC (A10, A13, A20).  It can use some of
# the 2D/3D hardware acceleration features.
#
# Finaly optimized for ODROID C2.
#
# GitHub: https://github.com/tnmeyer/xf86-video-fbturbo
#

url        = https://github.com/tnmeyer

repo_name  = xf86-video-fbturbo

#
# List of revisions to be extracted:
# =================================
#
# Revisions from 'aarch64' branch:
#                                               hash | version
#            ----------------------------------------+---------
revisions += 815280196e8929feb09e72f4325c180259a309ac-0.5.1


suffix     = tar.bz2
versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))
tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

git_repo   = .git_clone

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
	  hash=`echo $$revision | cut -f 1 -d '-'`    ; \
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ; \
	    ) ; \
	    tar xjf $(repo_name)-$$version.$(suffix) ; \
	    ( cd $(repo_name)-$$version ; ./autogen.sh ; rm -rf autom4te.cache .gitignore ) ; \
	    rm -f $(repo_name)-$$version.$(suffix)                          ; \
	    tar cjf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	    rm -rf $(repo_name)-$$version                                   ; \
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
