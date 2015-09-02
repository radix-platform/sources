
#
# SGX Embedded Systems DDK for Linux kernel:
# =========================================
#
# clone:
#   git clone https://github.com/MIPS/CI20_collateral.git
#

url        = git://radix.pro/Ingenic/graphics

repo_name  = CI20_collateral

pkgname    = ci20-sgx-km
kernel     = 3.0.8
version    = 1.13.3341330

git_repo   = .git_clone
tarball    = $(addsuffix .tar.xz, $(pkgname)-$(version))
sha1s      = $(addsuffix .sha1sum, $(tarball))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone SGX DDK $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarball): $(git_repo)
	@mkdir -p $(pkgname)-$(version)
	@tar -xzf $(repo_name)/$(pkgname)-$(version)_$(kernel).tgz -C $(pkgname)-$(version)
	@tar -cJf $(tarball) $(pkgname)-$(version)
	@rm -rf $(pkgname)-$(version)
	@touch $@

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarball) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
