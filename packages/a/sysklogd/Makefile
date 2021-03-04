#
# Project Home:
# ============
# https://www.infodrom.org/projects/sysklogd/
#
# Downloads:
# =========
# https://www.infodrom.org/projects/sysklogd/download.php
#
# NOTE: there is continuation on GitHub: https://github.com/troglobit/sysklogd
#
#
#url         = https://www.infodrom.org/projects/sysklogd/download
#
#versions    = 1.5 1.5.1
#pkgname     = sysklogd
#suffix      = tar.gz
#
#tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
#sha1s       = $(addsuffix .sha1sum, $(tarballs))
#
#
#all: $(tarballs) $(sha1s)
#
#.PHONY: downloads_clean
#
#$(tarballs):
#	@echo -e "\n======= Downloading source tarballs =======\n"
#	@for tarball in $(tarballs) ; do \
#	  wget -N $(url)/$$tarball ; \
#	done
#
#$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
#	@for tarball in $< ; do \
#	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
#	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
#	done
#
#downloads_clean:
#	@rm -rf $(tarballs) $(sha1s)

#
# Project Home:
# ============
#   https://github.com/troglobit/sysklogd
#
# Clone:
# =====
#   git clone https://github.com/troglobit/sysklogd.git
#

url        = https://github.com/troglobit

repo_name  = sysklogd
pkg_name   = sysklogd
suffix     = tar.xz

versions   = 2.2.0 2.2.1

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
	  tag=v`echo $$version` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$tag | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$$version.$(suffix) ; \
	  ( cd $(pkg_name)-$$version ; \
	    autoreconf --warnings=portability -vif ; \
	    rm -rf autom4te.cache .github .gitignore .travis.yml ) ; \
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
