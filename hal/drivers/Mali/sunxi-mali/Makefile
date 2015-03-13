
#
# Sunxi Mali-400 proprietary support libraries:
# ============================================
#
# Git:
# ===
#  https://github.com/linux-sunxi/sunxi-mali.git
#  https://github.com/linux-sunxi/sunxi-mali-proprietary.git
#

url        = git://radix.pro/Allwinner/graphics

sunxi_name        = sunxi-mali
proprietary_name  = sunxi-mali-proprietary

#
# List of tags to be extracted:
# ============================
#                                         sunxi hash |             proprietary hash           | sunxi-mali date
#            ----------------------------------------+----------------------------------------+-----------------
revisions  = d343311efc8db166d8371b28494f0f27b6a58724-1c5063f43cdc9de341c0d63b2e3921cab86c7742-20140326

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(shell echo $(tag) | cut -f 3 -d '-'))

tarballs   = $(addsuffix .tar.bz2, $(addprefix $(sunxi_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))

TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone $(sunxi_name).git repository =======\n"
	@rm -rf $(sunxi_name)
	@git clone $(url)/$(sunxi_name).git $(sunxi_name)
	@git clone $(url)/$(proprietary_name).git $(proprietary_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  sunxi_hash=`echo $$revision | cut -f 1 -d '-'` ; \
	  proprietary_hash=`echo $$revision | cut -f 2 -d '-'` ; \
	  version=`echo $$revision | cut -f 3 -d '-'` ; \
	  if [ ! -f $(sunxi_name)-$$version.tar.bz2 ]; then \
	    echo -e "\n======= Creating '$(sunxi_name)-$$version.tar.bz2' snapshot =======" ; \
	    ( cd $(sunxi_name) && \
	      git archive --format=tar --prefix=$(sunxi_name)-$$version/ $$sunxi_hash | \
	      bzip2 >../$(sunxi_name)-$$version.tar.bz2 ) ; \
	    ( cd $(proprietary_name) && \
	      git archive --format=tar --prefix= $$proprietary_hash | \
	      bzip2 >../$(proprietary_name)-$$version.tar.bz2 ) ; \
	    tar xjf $(sunxi_name)-$$version.tar.bz2 ; \
	    tar xjf $(proprietary_name)-$$version.tar.bz2 -C $(sunxi_name)-$$version/lib/mali ; \
	    ( cd $(sunxi_name)-$$version ; \
	      find . -type f -name ".*" -exec rm -f {} \; ) ; \
	    rm -f $(sunxi_name)-$$version.tar.bz2 $(proprietary_name)-$$version.tar.bz2 ; \
	    tar cjf $(sunxi_name)-$$version.tar.bz2 $(sunxi_name)-$$version ; \
	    rm -rf $(sunxi_name)-$$version ; \
	  fi ; \
	done

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(sha1s)
	@echo -e "\n======= Remove cloned $(sunxi_name).git repository =======\n"
	@rm -rf $(git_repo) $(sunxi_name) $(proprietary_name)

downloads_clean:
	@rm -rf $(tarballs) $(sha1s)
	@rm -rf $(git_repo) $(sunxi_name) $(proprietary_name)
