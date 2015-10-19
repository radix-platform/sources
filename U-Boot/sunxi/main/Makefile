
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
#
TAGS       = v2013.04-sunxi
TAGS      += v2013.10-sunxi


git_repo   = .git_clone
versions   = $(foreach tag, $(TAGS), $(shell echo $(tag) | sed 's/\(^[a-zA-Z]*\)\([0-9][0-9][0-9][0-9][.0-9]*[-a-zA-Z]*\)\(.*\)/\2/'))
tarballs   = $(addsuffix .tar.bz2, $(addprefix u-boot-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone Allwinner A1x $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  version=`echo $$tag | sed 's/\(^[a-zA-Z]*\)\([0-9][0-9][0-9][0-9][.0-9]*[-a-zA-Z]*\)\(.*\)/\2/'` ; \
	  if [ ! -f u-boot-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'u-boot-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=u-boot-$$version/ $$tag | \
	      bzip2 >../u-boot-$$version.tar.bz2 ) ; \
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
