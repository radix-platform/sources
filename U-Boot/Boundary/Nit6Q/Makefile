
#
# Boundary Devices i.MX6 U-Boot: https://github.com/boundarydevices/u-boot-imx6.git
#

url        = git://radix.pro/freescale/boundary

repo_name  = u-boot-imx6

#
# List of tags to be extracted:
# ============================
#
# Revisions from boundary-v2015.07 branch used for i.MX6
#
#                                               hash |     branch | date
#            ----------------------------------------+------------+------
revisions  = 51716cdbae34c02ec6bedec668e1745463fec2b2:imx6-2015.07:20160305


git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .$(suffix), $(addprefix u-boot-, $(versions)))
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
	  hash=`echo $$revision   | cut -f 1 -d ':'` ; \
	  branch=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision   | cut -f 3 -d ':'` ; \
	  if [ ! -f u-boot-$$branch-$$date.$(suffix) ]; then \
	    echo -e "\n======= Creating 'u-boot-$$branch-$$date.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=u-boot-$$branch-$$date/ $$hash | \
	      xz >../u-boot-$$branch-$$date.$(suffix) ) ; \
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
