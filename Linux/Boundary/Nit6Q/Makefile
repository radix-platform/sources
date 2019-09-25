
#
# Boundary Devices i.MX6 Linux Tree: https://github.com/boundarydevices/linux-imx6.git
#

url        = git://radix.pro/freescale/boundary

repo_name  = linux-imx6

#
# List of tags to be extracted:
# ============================
#                                               hash |    version | date
#            ----------------------------------------+------------+------

# Revisions from boundary-imx_3.14.28_1.0.0_ga branch used for i.MX6:
revisions  = f51af70093e980596fe15107b3848ef245ee4b4e:imx6-3.14.28:20160304

# Revisions from boundary-imx_4.1.15_2.0.0_ga branch used for i.MX6:
revisions += 690a19a892f2b3621fedbdffd45c694b478a649e:imx6-4.1.15:20190824

# Revisions from boundary-imx_4.9.x_1.0.0_ga branch used for i.MX6:
revisions += 1ec20712718b788a0c13dfedeabc29fe0002303e:imx6-4.9.88:20190824

# Revisions from boundary-imx_4.14.x_2.0.0_ga branch used for i.MX6:
revisions += 0457288099908383fd9d3b37047a6a400a79764a:imx6-4.14.98:20190925


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
