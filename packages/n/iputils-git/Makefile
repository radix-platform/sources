#
# Project Home:
# ============
#   http://www.linuxfoundation.org/collaborate/workgroups/networking/iputils
#
# Gitweb:
#   http://www.linux-ipv6.org/gitweb/gitweb.cgi?p=gitroot/iputils.git
#
# Clone:
# =====
#   git clone git://git.linux-ipv6.org/gitroot/iputils.git
#   git clone git://git.code.sf.net/p/iputils/code
#

url        = git://git.linux-ipv6.org/gitroot/iputils.git

repo_name  = iputils

versions   = s20121207 s20121221

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean


all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@if [ "$(url)" = 'git://radix.pro' ]; then \
	   git clone $(url)/$(repo_name).git $(repo_name) ; \
	 else \
	   git clone $(url) $(repo_name) ; \
	 fi
	@touch $@

$(tarballs): $(git_repo)
	@for version in $(versions) ; do \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$version | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  #tar xjf $(repo_name)-$$version.tar.bz2 ; \
	  #( cd $(repo_name)-$$version ; autoreconf -i ; rm -rf autom4te.cache ) ; \
	  #tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	  #rm -rf $(repo_name)-$$version ; \
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
