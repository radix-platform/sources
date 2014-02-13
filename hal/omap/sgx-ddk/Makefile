
#
# SGX Embedded Systems DDK for Linux kernel:
# =========================================
#
# clone:
#   $ git clone git://git.ti.com/graphics/omap5-sgx-ddk-linux
#

url        = git://radix.pro/TI/omap5

repo_name  = omap5-sgx-ddk-linux

#
# List of tags to be extracted:
#
TAGS       = ti_imgddk_1.9.0.11


git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(TAGS))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone SGX DDK $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for tag in $(TAGS) ; do \
	  if [ ! -f $$tag.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$$tag.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$$tag/ $$tag | \
	      bzip2 >../$$tag.tar.bz2 ) ; \
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
