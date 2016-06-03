#
# Project Home:
# ============
# http://www.x.org/wiki
#
# Downloads:
# =========
# http://www.x.org/releases/individual/driver
#
# cGit:
# ====
# https://cgit.freedesktop.org/xorg/driver/xf86-video-intel
#

url        = https://anongit.freedesktop.org/git/xorg/driver

repo_name  = xf86-video-intel

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+-----------
revisions  = 692c14d405bb352697b67f36a034d4963e272b66:2.99.916
revisions += baec802b21387d04aebb10ac29e719a1800c5aa0:2.99.917
revisions += b617f80ca5d386c1c248bab64276a9f283173a21:2.99.917.1

git_repo   = .git_clone

pkgname    = xf86-video-intel
suffix     = tar.bz2

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
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
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(pkgname)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkgname)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkgname)-$$version/ $$hash | \
	      bzip2 >../$(pkgname)-$$version.$(suffix) ) ; \
	    tar xjf $(repo_name)-$$version.$(suffix) ; \
	    ( cd $(repo_name)-$$version ; ./autogen.sh ; make distclean ; rm -rf autom4te.cache ) ; \
	    rm -f $(repo_name)-$$version.$(suffix) ; \
	    tar cjf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
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
