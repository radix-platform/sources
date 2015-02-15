#
# Project Home:
# ============
# http://www.webmproject.org
# https://code.google.com/p/webm
#
# NOTE: for i686, x86_64 only
#
# Clone:
# =====
# git clone http://code.google.com/p/webm.libvpx
#

url        = http://code.google.com/p/webm.libvpx

repo_name  = libvpx

#
# List of tags to be extracted:
#
TAGS       = 1.2.0 1.3.0


git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(TAGS)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url) $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ v$$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
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
