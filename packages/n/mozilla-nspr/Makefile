#
# Project Home:
# ============
# https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR
#
# Mercurial HG:
# ============
# https://hg.mozilla.org/projects/nspr
#
# Mercurial HG clone:
# ==================
# hg clone https://hg.mozilla.org/projects/nspr
#
# Get full HASH by short:
# ======================
#
#   $ hg log -rHASH --template 'node: {node}\n'
#
# where HASH - is a short revision, for example:
#
#   $ hg log -r88265db540d7 --template 'node: {node}\n'
#
# givs:
#
# node: 88265db540d75d59e12ea8dbc34031160fce9ccc
#

url        = https://hg.mozilla.org/projects

repo_name  = nspr

#
# List of tags to be extracted:
# ============================
#
#                                               hash | tag
#            ----------------------------------------+--------
revisions  = ad3ebb90bc9968055faadffb37233ad4cb956f85-NSPR_4_10_8_RTM
revisions += 2c9a94fefea664f8a84442fc959b37db119e2e25-NSPR_4_10_9_RTM
revisions += 21a7c4a68ca663ae2ba8ff05e12b9379f5108c5d-NSPR_4_10_10_RTM
revisions += ebae38973a1a7241482448091e96e4e4fe5dbc27-NSPR_4_11_RTM
revisions += 88265db540d75d59e12ea8dbc34031160fce9ccc-NSPR_4_12_RTM
revisions += bf4cbb1cb5f2c08691773575a79e4240ea7300fc-NSPR_4_23_RTM
revisions += 023a0ccfcb5c2745bd1d4864cc5f259784c958c6-NSPR_4_30_RTM


hg_repo    = .hg_clone

versions   = $(foreach tag, $(revisions), \
               $(shell echo $(tag) | cut -f 2 -d '-' | sed 's,NSPR_,,' | sed 's,_RTM,,' | sed 's,_,\.,g'))

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
	  version=`echo $$revision | cut -f 2 -d '-' | sed 's,NSPR_,,' | sed 's,_RTM,,' | sed 's,_,\.,g'` ; \
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
