#
# Project Home:
# ============
# http://wireless.kernel.org/en/developers/Regulatory/CRDA
#
# Downloads:
# =========
# http://wireless.kernel.org/download/crda
# https://www.kernel.org/pub/software/network/crda
#

url         = https://www.kernel.org/pub/software/network/crda

versions    = 1.1.1 1.1.3 3.13
pkgname     = crda
suffix      = tar.xz

repo_name   = wireless-regdb

TAGS        = master-2014-10-07
TAGS       += master-2014-11-07

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
regdbs     += $(foreach tag, $(TAGS), \
                $(addsuffix .$(suffix), \
                  $(addprefix $(repo_name)-,$(shell echo $(tag) | sed 's/[a-z-]//g'))))
tarballs   += $(regdbs)

sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for version in $(versions) ; do \
	   wget -N $(url)/$(pkgname)-$$version.$(suffix) ;  \
	 done
	@echo -e "\n======= Downloading latest Regulatory Database =======\n"
	@rm -rf $(repo_name)
	@git clone \
	   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-regdb.git \
	   $(repo_name)
	@for tag in $(TAGS) ; do \
	   version=`echo $$tag | sed 's/[a-z-]//g'` ; \
	   rm -f $(repo_name)-$$version.$(suffix) ; \
	   ( cd $(repo_name) ; \
	      git archive --format=tar --prefix=$(repo_name)-$$version/ $$tag | \
	      bzip2 >../$(repo_name)-$$version.$(suffix) ) ; \
	 done
	@rm -rf $(repo_name)

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(sha1s) $(repo_name)
