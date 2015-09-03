
#
# WiFi Firmware for BRCM4330 chip:
# ===============================
#
# clone:
#   git clone https://github.com/ZubairLK/ci20_other_files.git
#

url        = https://github.com/ZubairLK

repo_name  = ci20_other_files

pkgname    = ci20-brcm4330-fw
version    = 0.0.0

git_repo   = .git_clone
tarball    = $(addsuffix .tar.xz, $(pkgname)-$(version))
sha1s      = $(addsuffix .sha1sum, $(tarball))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarball): $(git_repo)
	@mkdir -p $(pkgname)-$(version)/lib/firmware/brcm
	@cp -a $(repo_name)/brcm/brcmfmac4330-sdio.bin \
	       $(repo_name)/brcm/brcmfmac4330-sdio.txt \
	             $(pkgname)-$(version)/lib/firmware/brcm
	@cp -a wifi-firmware.txt $(pkgname)-$(version)/README
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
