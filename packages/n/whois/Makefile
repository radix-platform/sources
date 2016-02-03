#
# Project Home:
# ============
# https://github.com/rfc1036/whois
#
# GitHub:
# ======
# https://github.com/rfc1036/whois
# clone git://github.com/rfc1036/whois.git
#
# Old Download Link:
# =================
# ftp://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.1.tar.xz
#

url          = git://github.com/rfc1036/whois.git

repo_name    = whois

versions     = 5.0.25 5.2.1 5.2.11
pkgname      = whois
suffix       = tar.bz2

git_repo     = .git_clone
tarballs     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s        = $(addsuffix .sha1sum, $(tarballs))

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
	  tag=`echo v$$version` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ) ; \
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
