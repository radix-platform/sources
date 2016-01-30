#
# Project Home:
# ============
#   https://github.com/oskarirauta/populatefs.git
#
# Downloads:
# =========
#   https://github.com/oskarirauta/populatefs/releases
#   https://github.com/oskarirauta/populatefs/archive/v0.9.tar.gz - initial version
#
# Clone:
# =====
#   git clone https://github.com/oskarirauta/populatefs.git populatefs
#

url        = https://github.com/oskarirauta
#url        = git://radix.pro

repo_name  = populatefs

#
# List of tags to be extracted:
# ============================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 9cb86b88d29601e73f9d78eeb3430a0a32b33057-0.9
revisions += e9f9f623596cbc43495c1f26741805c7a0ca627e-1.0


git_repo   = .git_clone
suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))
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
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
	  hash=`echo $$revision | cut -f 1 -d '-'`    ; \
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
