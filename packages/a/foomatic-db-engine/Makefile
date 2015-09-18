#
# Project Home:
# ============
#   http://www.linuxfoundation.org/collaborate/workgroups/networking/iputils
#
# Repositories:
#   http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic
#
# Clone:
# =====
#   bzr branch http://bzr.linuxfoundation.org/openprinting/foomatic/foomatic-db-engine
#
#   check http://bzr.linuxfoundation.org/loggerhead/openprinting/foomatic/
#   for latest commits and development, identical to foomatic-4.0 branch
#

url        = http://bzr.linuxfoundation.org/openprinting/foomatic

repo_name  = foomatic-db-engine

#            revision | date
#            ---------+---------
revisions  =       371:20150616


bzr_repo   = .bzr_clone

suffix     = tar.xz

tarballs   = $(addsuffix .$(suffix), $(addprefix $(repo_name)-, \
               $(foreach revision,$(revisions),$(shell echo $(revision) | cut -f 2 -d ':'))))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean


all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(bzr_repo):
	@echo -e "\n======= Clone $(repo_name) repository =======\n"
	@rm -rf $(repo_name)
	@bzr branch $(url)/$(repo_name) $(repo_name)
	@touch $@

$(tarballs): $(bzr_repo)
	@for revision in $(revisions) ; do \
	  version=`echo $$revision | cut -f 1 -d ':'` ; \
	     date=`echo $$revision | cut -f 2 -d ':'` ; \
	  if [ ! -f $(repo_name)-$$date.$(suffix) ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$date.$(suffix)' --revision $$version snapshot =======" ; \
	    ( cd $(repo_name) && \
	      bzr export --format=tar --root=$(repo_name)-$$date/ --revision $$version \
	      ../$(repo_name)-$$date.tar ) ; \
	  fi ; \
	  tar xf $(repo_name)-$$date.tar ; \
	  rm  -f $(repo_name)-$$date.tar ; \
	  ( cd $(repo_name)-$$date ; ./make_configure ; \
	    rm -rf autom4te.cache  ; echo "$$version" > .bzr_revision ) ; \
	  tar cJf $(repo_name)-$$date.$(suffix) $(repo_name)-$$date ; \
	  rm -rf $(repo_name)-$$date ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name) repository =======\n"
	@rm -rf $(bzr_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(bzr_repo) $(repo_name)
