#
# Project Home:
# ============
# https://github.com/libproxy/libproxy
#
# Clone:
# =====
# git clone https://github.com/libproxy/libproxy.git
#
# Downloads:
# =========
# https://github.com/libproxy/libproxy/releases
#

url         = https://github.com/libproxy

repo_name   = libproxy

#
# List of tags to be extracted:
# ============================
#
#                                                hash | version
#             ----------------------------------------+---------
revisions   = 06a5bf2f5c212e233cdd2f63f2bd45340c3d6e2b-0.4.11
revisions  += 88008bb028104de2669fb15f0f489beaad9c2fae-0.4.12
revisions  += 5924d4223e2b7238607749d977c0a878fe33cdbc-0.4.15
revisions  += e78a5ccfe0a2340f2c73e419767f8492ffc2787a-0.4.17

git_repo    = .git_clone

pkgname     = libproxy
suffix      = tar.xz

versions    = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d '-'))
tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
sha1s       = $(addsuffix .sha1sum, $(tarballs))

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
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(pkgname)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(pkgname)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(pkgname)-$$version/ $$hash | \
	      xz >../$(pkgname)-$$version.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
