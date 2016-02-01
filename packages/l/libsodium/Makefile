#
# Project Home:
# ============
# https://github.com/jedisct1/libsodium
#
# Clone:
# =====
# git clone https://github.com/jedisct1/libsodium.git
#

url        = https://github.com/jedisct1/libsodium.git

repo_name  = libsodium

#
# List of tags to be extracted:
#
TAGS       = 1.0.1 1.0.7 1.0.8


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
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	    tar xjf $(repo_name)-$$version.tar.bz2 ; \
	    rm -f $(repo_name)-$$version.tar.bz2 ; \
	    ( cd $(repo_name)-$$version ; ./autogen.sh ; rm -rf autom4te.cache ) ; \
	    tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	    rm -rf  $(repo_name)-$$version ; \
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
