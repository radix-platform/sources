
#
# Freescale i.MX Linux Tree: http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git
#

url        = git://radix.pro/freescale

repo_name  = linux-2.6-imx

#
# List of tags to be extracted:
# ============================
#
# Revisions from imx_3.0.35_4.1.0 branch used for iMX.6
#
#                                               hash |   branch | date
#            ----------------------------------------+----------+------
revisions  = 8d2b169fd78ab7d7903d5686021596d8adb9e930:imx-3.0.35:20140124
revisions += 0c58d0f15879856dd750223abeeb0410a0891ca2:imx-3.0.35:20140614
#
# Revisions from imx_3.14.28_1.0.0_ga branch used for iMX.6
#
#                                               hash |    branch | date
#            ----------------------------------------+-----------+------
revisions += 91cf351a2afc17ac4a260e4d2ad1e32d00925a1b:imx-3.14.28:20150320


git_repo   = .git_clone

suffix     = tar.xz

versions   = $(foreach tag, $(revisions), $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .$(suffix), $(addprefix linux-, $(versions)))
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
	  if [ ! -f linux-$$branch-$$date.$(suffix) ]; then \
	    echo -e "\n======= Creating 'linux-$$branch-$$date.$(suffix)' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$$branch-$$date/ $$hash | \
	      xz >../linux-$$branch-$$date.$(suffix) ) ; \
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
