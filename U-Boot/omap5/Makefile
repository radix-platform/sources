
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
# ============================
#
# Revisions from p-ti-u-boot-2014.07 branch used for OMAP5 & DRA7xx
#
#  'a53c7be0d4920d7ac9fb9bc682164b8702458c8e' latest at 15th  October 2015
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = a53c7be0d4920d7ac9fb9bc682164b8702458c8e-20151015

git_repo   = .git_clone

denx       = 2014.07
versions   = $(foreach tag, $(revisions), $(addprefix $(denx)-, $(shell echo $(tag) | cut -f 2 -d '-')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(versions)))
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
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  date=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(repo_name)-$(denx)-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$(denx)-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$(denx)-$$date/ $$hash | \
	      bzip2 >../$(repo_name)-$(denx)-$$date.tar.bz2 ) ; \
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
