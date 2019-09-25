
#
# NXP Devices i.MX6 Linux Tree: https://source.codeaurora.org/external/imx/linux-imx.git
#

url        = git://radix.pro/NXP

repo_name  = linux-imx

#
# List of tags to be extracted:
# ============================
#
# Revisions from imx_4.1.15_2.0.0_ga branch used for i.MX6:
#
#                                               hash |  version | date
#            ----------------------------------------+----------+------
revisions += 30278abfe0977b1d2f065271ce1ea23c0e2d1b6e:imx-4.1.15:20170504
#
# Revisions from imx_4.9.88_2.0.0_ga branch used for i.MX6:
#
#                                               hash |  version | date
#            ----------------------------------------+----------+------
revisions += 6507266728a7806d850ce22ec923d90cf4aa4318:imx-4.9.88:20180525
#
# Revisions from imx_4.14.98_2.0.0_ga branch used for i.MX6:
#
#                                               hash |   version | date
#            ----------------------------------------+-----------+------
revisions += 1175b59611537b0b451e0d1071b1666873a8ec32:imx-4.14.98:20190418


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
