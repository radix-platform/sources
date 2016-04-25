#
# Project Home:
# ============
# https://pypi.python.org/pypi/wheel
# https://bitbucket.org/pypa/wheel
#
# BitBucket.org:
# =============
# hg clone https://bitbucket.org/pypa/wheel
#

url        = https://bitbucket.org/pypa

repo_name  = wheel

versions   = 0.29.0
pkgname    = wheel
suffix     = tar.xz

hg_repo    = .hg_clone

tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(hg_repo):
	@echo -e "\n======= Clone $(repo_name) repository =======\n"
	@rm -rf $(repo_name)
	@hg clone -b default $(url)/$(repo_name) $(repo_name)
	@touch $@

$(tarballs): $(hg_repo)
	@for version in $(versions) ; do \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      hg archive --type tar --prefix $(repo_name)-$$version --rev $$version - | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name) repository =======\n"
	@rm -rf $(hg_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(hg_repo) $(repo_name)
