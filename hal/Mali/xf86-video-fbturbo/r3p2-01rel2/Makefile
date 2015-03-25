
#
# xf86-video-fbturbo (Mali r3p2-01rel2)
# =====================================
#
# video driver, primarily optimized for the devices powered
# by the Allwinner SoC (A10, A13, A20).  It can use some of
# the 2D/3D hardware acceleration features.
#
# Git: https://github.com/ssvb/xf86-video-fbturbo
#

url        = git://radix.pro/Allwinner/graphics

repo_name  = xf86-video-fbturbo

#
# List of revisions to be extracted:
# =================================
#
# Revisions for downloading tags:
#                                               hash | ver | tag flag
#            ----------------------------------------+-----+----------

#
# Revisions from 'mali-r3p2-support' branch:
#                                               hash | version
#            ----------------------------------------+---------
revisions += 6ec85e995e855ab537df905e3717ba3c7935e108-0.3.1


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
	  tag=`echo $$revision | cut -f 3 -d '-'`     ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ) ; \
	    if [ -z "$$tag" ] ; then \
	      tar xjf $(repo_name)-$$version.$(suffix) ; \
	      ( cd $(repo_name)-$$version ; ./autogen.sh ; make distclean ; rm -rf autom4te.cache .gitignore ) ; \
	      rm -f $(repo_name)-$$version.$(suffix)                          ; \
	      tar cjf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	      rm -rf $(repo_name)-$$version                                   ; \
	    fi ; \
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
