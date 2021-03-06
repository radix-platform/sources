#
# Project Home:
# ============
#   https://hwmon.wiki.kernel.org/lm_sensors
#
# Clone:
# =====
#   git clone https://github.com/lm-sensors/lm-sensors.git
#

url        = https://github.com/lm-sensors

repo_name  = lm-sensors

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 1667b850a1ce38151dae17156276f981be6fb557:3.6.0


git_repo   = .git_clone
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
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
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
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
