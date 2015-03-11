
#
# Rob Clark <rob.clark@linaro.org>:
# ================================
#   split out dri2 client side code from mesa, libva, libvdpau, etc...
#
# Git: https://github.com/robclark/libdri2
#

url        = git://radix.pro/Allwinner/graphics

repo_name  = libdri2

#
# List of tags to be extracted:
# ============================
#                                               hash | version
#            ----------------------------------------+---------
revisions  = 4f1eef3183df2b270c3d5cbef07343ee5127a6a4-1.0.0

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
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	    tar xjf $(repo_name)-$$version.tar.bz2 ; \
	    ( cd $(repo_name)-$$version ; ./autogen.sh ; make distclean ; rm -rf autom4te.cache .gitignore ) ; \
	    rm -f $(repo_name)-$$version.tar.bz2 ; \
	    tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	    rm -rf $(repo_name)-$$version ; \
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
