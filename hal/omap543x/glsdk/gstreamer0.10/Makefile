
#
# TI GLSDK gstreamer:
# ==================
#
# clone:
#   $ git clone git://git.ti.com/glsdk/gstreamer0-10.git
#

url        = git://radix.pro/TI/glsdk

repo_name  = gstreamer0-10

#
# List of tags to be extracted:
#
#                        TAG | tarball prefix
#            ----------------+--------------------
TAGS       = glsdk-6_00_00_07:gstreamer-ti-0.10.36

suffix     = tar.xz

git_repo   = .git_clone
tarballs   = $(addsuffix .$(suffix), $(foreach tag,$(TAGS),$(shell echo $(tag) | cut -f 2 -d ':')))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone TI GLSDK $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@( cd $(repo_name) ; git submodule update --init --recursive )
	@touch $@

$(tarballs): $(git_repo)
	@for tg in $(TAGS) ; do \
	  tag=`echo $$tg | cut -f 1 -d ':'` ; \
	  prefix=`echo $$tg | cut -f 2 -d ':'` ; \
	  mkdir -p $$prefix ; \
	  if [ ! -f $$tag.$(suffix) ]; then \
	    echo -e "\n======= Creating '$$prefix.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$$prefix/ $$tag | \
	      tar -x -C .. ) ; \
	    ( cd $(repo_name)/common && \
	      git archive --format=tar HEAD | tar -x -C ../../$$prefix/common ) ; \
	    tar cJf $$prefix.tar.xz $$prefix ; \
	    rm -rf $$prefix ; \
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
