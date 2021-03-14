#
# Project Home:
# ============
# https://packages.qa.debian.org/d/debianutils.html
#
# Downloads:
# =========
# ftp://ftp.de.debian.org/debian/pool/main/d/debianutils
#
# NOTE: there is continuation on GitLab: https://salsa.debian.org/debian/debianutils
#

url        = https://salsa.debian.org/debian

repo_name  = debianutils
pkg_name   = debianutils
suffix     = tar.xz

versions   = 4.9 4.10 4.11 4.11.2

# List of tags to be extracted:
TAGS       = $(addprefix v, $(versions))

git_repo   = .git_clone
tarballs   = $(addsuffix .tar.xz, $(addprefix $(pkg_name)-, $(versions)))
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
	@for version in $(versions) ; do \
	  tag=debian/`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$tag | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; \
	    autoreconf -vif ; \
	    rm -rf autom4te.cache ) ; \
	  tar cJf $(pkg_name)-$$version.$(suffix) $(pkg_name)-$$version ; \
	  rm -rf $(pkg_name)-$$version ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
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
