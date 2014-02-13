
#
# Omap 3/4 development platfrom u-boot:
# ====================================
#
# clone:
#   $ git clone git://git.omapzoom.org/repo/u-boot.git
#

url        = git://radix.pro/TI/omap5

repo_name  = u-boot-omap

#
# List of tags to be extracted:
#
TAGS       = 6AJ.1.2-RC3


git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(TAGS)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone Texas Omap 3/4 $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  if [ ! -f $(repo_name)-$$tag.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$tag.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$tag/ $$tag | \
	      bzip2 >../$(repo_name)-$$tag.tar.bz2 ) ; \
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
