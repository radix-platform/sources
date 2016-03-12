
#
# SGX Embedded Systems DDK for Linux kernel:
# =========================================
#
# clone:
#   $ git clone git://git.ti.com/graphics/omap5-sgx-ddk-linux
#

url        = git://radix.pro/TI/wireless

repo_name  = wl18xx_fw

#
# List of tags to be extracted:
#
TAGS       = ol_r8.a8.09
TAGS      += ol_r8.a8.10


git_repo   = .git_clone
tarballs   = $(addsuffix .tar.bz2, $(addprefix $(repo_name)-, $(TAGS)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone TI-OpenLink $(repo_name).git repository =======\n"
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
	    tar xjf $$tag.tar.bz2 ; \
	    rm -f $$tag.tar.bz2 ; \
	    mv $$tag $(repo_name)-$$tag ; \
	    tar cjf $(repo_name)-$$tag.tar.bz2 $(repo_name)-$$tag ; \
	    rm -rf $(repo_name)-$$tag ; \
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
