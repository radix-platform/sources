#
# Project Home:
# ============
# https://developer.trustedfirmware.org/dashboard/view/6/
#
# Clone:
# =====
#   git clone https://github.com/ARM-software/arm-trusted-firmware.git
#

url        = https://github.com/ARM-software

repo_name  = arm-trusted-firmware
pkg_name   = arm-trusted-firmware
suffix     = tar.xz

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = c158878249f1bd930906ebd744b90d3f2a8265f1:2.5
revisions += a5394205e94b70faf7ddd34841528ec631711d1a:2.5.1


git_repo   = .git_clone
versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
tarballs   = $(addsuffix .tar.xz, $(addprefix $(pkg_name)-, $(versions)))
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
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkg_name)-$$version/ $$hash | \
	      xz >../$(pkg_name)-$$version.$(suffix) ) ; \
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
