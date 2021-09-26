#
# Project Home:
# ============
# https://nixos.org/patchelf.html
#
# GitHub:
# ======
# https://github.com/NixOS/patchelf
#

url        = https://github.com/NixOS

repo_name  = patchelf

#
# List of revisions to be extracted:
# =================================
#
#                                               hash | version
#            ----------------------------------------+--------
revisions  = 44b7f9583ffe0ee09c4da8bd996ef9a6a0017e1a-0.9
revisions += 27ffe8ae871e7a186018d66020ef3f6162c12c69-0.10.1
revisions += 978325def61e0126d13d7936eee51326cbd433d4-0.10.2
revisions += 8d3a16e97294e3c5521c61b4c8835499c9918264-0.12
revisions += a949ff23315bbb5863627c4655fe216ecbf341a2-0.13

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
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  version=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$hash | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	  tar xJf $(repo_name)-$$version.$(suffix) ; \
	  ( cd $(repo_name)-$$version ; ./bootstrap.sh ; rm -rf autom4te.cache .gitignore ) ; \
	  tar cJf $(repo_name)-$$version.$(suffix) $(repo_name)-$$version ; \
	  rm -rf $(repo_name)-$$version ; \
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
