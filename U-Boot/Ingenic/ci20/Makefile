
#
# MIPS Creator CI20 native u-boot:
# ===============================
#   http://elinux.org/CI20_Dev_Zone#Building_uboot_from_sources
#
# clone:
#   $ git clone https://github.com/MIPS/CI20_u-boot.git
#

url        = git://radix.pro/Ingenic/u-boot

repo_name  = CI20_u-boot

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'ci20-v2013.10' branch. Supports MIPS Creator CI20.
#
#                                               hash | date
#            ----------------------------------------+--------
revisions  = 6cfaf802b580f2f7e92a5dec705ff9c196c637b4-20150826

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix ci20-2013.10-, $(shell echo $(tag) | cut -f 2 -d '-')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix u-boot-, $(versions)))
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
	  date=`echo $$revision | cut -f 2 -d '-'` ; \
	  if [ ! -f u-boot-ci20-2013.10-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'u-boot-ci20-2013.10-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=u-boot-ci20-2013.10-$$date/ $$hash | \
	      bzip2 >../u-boot-ci20-2013.10-$$date.tar.bz2 ) ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
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
