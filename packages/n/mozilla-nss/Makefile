#
# Project Home:
# ============
# https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS
#
# Mercurial HG:
# ============
# https://hg.mozilla.org/projects/nss
#
# Mercurial HG clone:
# ==================
# hg clone https://hg.mozilla.org/projects/nss
#
# Get full HASH by short:
# ======================
#
#   $ hg log -rHASH --template 'node: {node}\n'
#
# where HASH - is a short revision, for example:
#
#   $ hg log -raee88368c8c1 --template 'node: {node}\n'
#
# givs:
#
# node: aee88368c8c13ac700be24fb54b07e039c9d0796
#

url        = https://hg.mozilla.org/projects

repo_name  = nss

#
# List of tags to be extracted:
# ============================
#
#                                               hash | tag
#            ----------------------------------------+--------
revisions  = 537d7fc8624c289e4f818a4c69847eaedecceccb-NSS_3_19_1_RTM
revisions += 97d30005dd7bb02b15bd2b8a27e2426c49d06d69-NSS_3_19_2_RTM
revisions += 507694132f6f0706e7b8e33dac63a560a89f67fc-NSS_3_21_RTM
revisions += ee1254aeba3e9929858d24f071bafcabea32ad4a-NSS_3_22_RTM
revisions += aee88368c8c13ac700be24fb54b07e039c9d0796-NSS_3_23_RTM
revisions += decbf7bd40fd57b808a42b8673d425e3f2670a89-NSS_3_46_RTM
revisions += 7ccb4ade557739620b060c173d8660c502e53034-NSS_3_47_RTM
revisions += 2c75831cea425ad082ab74f9993c857cdc6b4bdc-NSS_3_63_RTM
revisions += ef126608d281cc268e204e65503e1a5b84d53241-NSS_3_64_RTM


hg_repo    = .hg_clone

versions   = $(foreach tag, $(revisions), \
               $(shell echo $(tag) | cut -f 2 -d '-' | sed 's,NSS_,,' | sed 's,_RTM,,' | sed 's,_,\.,g'))

suffix     = tar.xz
tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(hg_repo):
	@echo -e "\n======= Clone $(repo_name) repository =======\n"
	@rm -rf $(repo_name)
	@hg clone -b default $(url)/$(repo_name) $(repo_name)
	@touch $@

$(tarballs): $(hg_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  version=`echo $$revision | cut -f 2 -d '-' | sed 's,NSS_,,' | sed 's,_RTM,,' | sed 's,_,\.,g'` ; \
	  if [ ! -f $(repo_name)-$$version.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      hg archive --type tar --prefix $(repo_name)-$$version --rev $$hash - | \
	      xz >../$(repo_name)-$$version.$(suffix) ) ; \
	  fi ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name) repository =======\n"
	@rm -rf $(hg_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(hg_repo) $(repo_name)
