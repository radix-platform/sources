
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
# Revisions from p-ti-u-boot-2013.04 branch used for OMAP5 GLSDK
#
#  '7628b83cf69a24b0f454bf0a3d6ee076438eb169' latest at 16th February 2014
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 7628b83cf69a24b0f454bf0a3d6ee076438eb169-20140216
revisions += 35e3fea5d315c91448d10554b69acc8364ca65c1-20140307
revisions += 6274e7dc383d18f5a4cb6c901f8406d9728adfd8-20141112

git_repo   = .git_clone

denx       = 2013.04
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
