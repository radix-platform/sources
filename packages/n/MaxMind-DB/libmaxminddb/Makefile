#
# Project Home:
# ============
# https://dev.maxmind.com/geoip/geoip2/web-services
# https://dev.maxmind.com/maxmind-db
#
# Clone:
# =====
# git clone https://github.com/maxmind/libmaxminddb.git
#
# Downloads:
# =========
# https://github.com/maxmind/libmaxminddb/releases/download/${VERSION}/libmaxminddb-${VERSION}.tar.gz
#

url         = https://github.com/maxmind

repo_name   = libmaxminddb

#
# List of tags to be extracted:
# ============================
#
#                                                hash | version
#             ----------------------------------------+---------
revisions   = fc183662e85cb1b252c2f0272dc41f79e52e50fa:1.4.2
revisions  += d9a1a7f66918f7a8d518cfd1c120b9f73f489fc1:1.5.2

git_repo    = .git_clone

pkgname     = libmaxminddb
suffix      = tar.xz

versions    = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 2 -d ':'))
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
	  hash=`echo $$revision | cut -f 1 -d ':'` ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
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
