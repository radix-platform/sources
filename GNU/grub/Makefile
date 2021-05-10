#
# Project Home:
# ============
# https://www.gnu.org/software/grub
#
# Savannah cGit:
# =============
# http://git.savannah.gnu.org/cgit/grub.git
#
# Clone:
# =====
# git clone git://git.savannah.gnu.org/grub.git
# git clone https://git.savannah.gnu.org/git/grub.git
# git clone ssh://git.savannah.gnu.org/srv/git/grub.git
#

url        = https://git.savannah.gnu.org/git/

repo_name  = grub
pkg_name   = grub

#
# List of tags to be extracted:
# ============================
#                                               hash | tag
#            ----------------------------------------+-----
revisions  = 2a2e10c1b39672de3d5da037a50d5c371f49b40d:2.04
revisions += 837fe48deb89b31710904de4e9c7dda258490e1c:2.05.1
revisions += c0e647eb0e2bd09315612446cb4d90f7f75cb44c:2.05.2

git_repo   = .git_clone
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))

tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
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
	  hash=`echo $${revision}    | cut -f 1 -d ':'` ; \
	  version=`echo $${revision} | cut -f 2 -d ':'` ; \
	  if [ ! -f $(repo_name)-$${version}.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$${version}.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$${version}/ $${hash} | \
	      xz >../$(repo_name)-$${version}.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(pkg_name)-$${version}.$(suffix) ; \
	  ( cd $(pkg_name)-$${version} ; \
	    # ======= Remove ~rc revision ======= ; \
	    echo -e "\n======= Remove ~rc (release candidate) micro version =======" ; \
	    rc=`echo $${version} | cut -f3 -d'.'` ; \
	    if [ "x$$rc" != "x" ] ; then \
	      sed -i "s,\[[0-9]\.[0-9][0-9]~rc[1-9a-z]*\],\[$${version}\]," configure.ac ; \
	    fi ; \
	    ./bootstrap ; rm -rf autom4te.cache .gitignore .travis.yml ) ; \
	  tar cJf $(pkg_name)-$${version}.$(suffix) $(pkg_name)-$${version} ; \
	  rm -rf $(pkg_name)-$${version} ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$${tarball}' sha1sum =======" ; \
	  sha1sum --binary $${tarball} > $${tarball}.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
