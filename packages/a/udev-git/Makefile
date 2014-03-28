#
# Project Home:
# ============
#
# The udev development has moved to:
# ---------------------------------
#   http://www.freedesktop.org/wiki/Software/systemd
#   http://cgit.freedesktop.org/systemd/systemd/
#
# This is latest releases from kernel.org
#
# Downloads:
# =========
#   ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug
#
# cGit:
#  http://git.kernel.org/cgit/linux/hotplug/udev.git
#
# Clone:
# =====
#  git clone git://git.kernel.org/pub/scm/linux/hotplug/udev.git
#

url        = git://git.kernel.org/pub/scm/linux/hotplug/udev.git

repo_name  = udev

#
# List of tags to be extracted:
#
TAGS       = 181
TAGS      += 182


git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag)))
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
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag` ; \
	  if [ ! -f $(repo_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.tar.bz2 ) ; \
	  fi ; \
	  tar xjf $(repo_name)-$$version.tar.bz2 ; \
	  ( cd $(repo_name)-$$version ; ./autogen.sh; gtkdocize --copy ; rm -rf autom4te.cache ) ; \
	  tar cjf $(repo_name)-$$version.tar.bz2 $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
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
