
#
# Allwinner A1x native u-boot:
# ===========================
#   https://github.com/linux-sunxi/u-boot-sunxi/wiki
#
# clone:
#   $ git clone https://github.com/linux-sunxi/u-boot-sunxi.git
#

url        = git://radix.pro

repo_name  = u-boot-sunxi

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'sunxi' branch. Supports A10, A13, A10s and A20.
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions  = 2e4c69208f08b0203a1d3936376d2b5a8b494ac4:2014.04:20140713
revisions += ea1ac32bf76eb60baef474c2516fc431b381d952:2014.04:20141124

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), \
               $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, \
               $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .tar.xz, $(addprefix $(repo_name)-, $(versions)))
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
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision | cut -f 3 -d ':'`    ; \
	  if [ ! -f $(repo_name)-$$version-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version-$$date/ $$hash | \
	      xz >../$(repo_name)-$$version-$$date.tar.xz ) ; \
	  fi ; \
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
