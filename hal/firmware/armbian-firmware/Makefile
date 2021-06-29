
#
# Armbian Firmware for the Linux Kernel: https://github.com/armbian/firmware.git
#

url        = https://github.com/armbian

repo_name  = firmware

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+--------------
revisions  = 761658e1701c77a0a84706754e6db1a25ee60b82:20210505

git_repo   = .git_clone

pkgname    = armbian-firmware
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
tarballs   = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
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
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  date=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(pkgname)-$$date.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkgname)-$$date.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkgname)-$$date/ $$hash | \
	      xz >../$(pkgname)-$$date.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
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
