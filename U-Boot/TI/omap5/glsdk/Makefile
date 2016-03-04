
#
# Omap 3/4 development platfrom u-boot:
# ====================================
#
# clone:
#   $ git clone git://git.omapzoom.org/repo/u-boot.git
#

url        = git://radix.pro/TI/omap5

repo_name  = u-boot-omap

#
# List of tags to be extracted:
# ============================
#
# Revisions used for OMAP5 & DRA7xx GLSDK (branch: p-ti-u-boot-2014.07)
#
# revision '32166d3e764799cb27e4cf9c5e75e4019d1062e1' used by GLSDK 7_03_00_03
# revision 'dc9c89cd1e671d0767ba48a5a0e7d696c35c6b57' at 20160225
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions  = 32166d3e764799cb27e4cf9c5e75e4019d1062e1:2014.07:20151209
revisions += dc9c89cd1e671d0767ba48a5a0e7d696c35c6b57:2014.07:20160225

#
# Legacy 2014.07 - 2013.04 U-Boot:
# ===============================
#
# Revisions from p-ti-u-boot-2014.07-glsdk branch used for OMAP5 GLSDK
#
# revision 'b89e568d9c356d756501b16caad5734970ec25d1' 16th February 2015
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions += b89e568d9c356d756501b16caad5734970ec25d1:2014.07:20150216

#
# Revisions from p-ti-u-boot-2014.07 branch used for OMAP5 & DRA7xx
#
# revision 'a53c7be0d4920d7ac9fb9bc682164b8702458c8e' 15th  October 2015
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions += 92f924cb8f37cddf12d7d9fde45bde63680dac3d:2014.07:20151008
revisions += a53c7be0d4920d7ac9fb9bc682164b8702458c8e:2014.07:20151015

#
# Revisions from p-ti-u-boot-2013.04 branch used for OMAP5 GLSDK
#
# revision '7628b83cf69a24b0f454bf0a3d6ee076438eb169' 16th February 2014
#
#                                               hash |  denx | date
#            ----------------------------------------+-------+--------
revisions += 7628b83cf69a24b0f454bf0a3d6ee076438eb169:2013.04:20140216
revisions += 35e3fea5d315c91448d10554b69acc8364ca65c1:2013.04:20140307
revisions += 6274e7dc383d18f5a4cb6c901f8406d9728adfd8:2013.04:20141112


git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), \
               $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, \
               $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .tar.xz, $(addprefix $(repo_name)-, $(versions)))
sha1s      = $(addsuffix .sha1sum, $(tarballs))


TARGETS = repository_clean

all: $(TARGETS)

.PHONY: downloads_clean repository_clean

$(git_repo):
	@echo -e "\n======= Clone Texas Omap 3/4 $(repo_name).git repository =======\n"
	@rm -rf $(repo_name)
	@git clone $(url)/$(repo_name).git $(repo_name)
	@touch $@

$(tarballs): $(git_repo)
	@for revision in $(revisions) ; do \
	  hash=`echo $$revision | cut -f 1 -d ':'`    ; \
	  version=`echo $$revision | cut -f 2 -d ':'` ; \
	  date=`echo $$revision | cut -f 3 -d ':'`    ; \
	  if [ ! -f $(repo_name)-$$version-$$date.tar.xz ]; then \
	    echo -e "\n======= Creating '$(repo_name)-$$version-$$date.tar.xz' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=$(repo_name)-$$version-$$date/ $$hash | \
	      xz >../$(repo_name)-$$version-$$date.tar.xz ) ; \
	  fi ; \
	done

$(sha1s): %.tar.xz.sha1sum : %.tar.xz
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
