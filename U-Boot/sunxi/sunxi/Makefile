
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
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 2e4c69208f08b0203a1d3936376d2b5a8b494ac4-20140713
revisions += ea1ac32bf76eb60baef474c2516fc431b381d952-20141124

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix sunxi-, $(shell echo $(tag) | cut -f 2 -d '-')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix u-boot-, $(versions)))
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
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  date=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f u-boot-sunxi-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'u-boot-sunxi-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=u-boot-sunxi-$$date/ $$hash | \
	      bzip2 >../u-boot-sunxi-$$date.tar.bz2 ) ; \
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
