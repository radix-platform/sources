
#
# MIPS Creator CI20 Linux Kernel: https://github.com/MIPS/CI20_linux
#

url        = git://radix.pro/Ingenic/linux

repo_name  = CI20_linux

#
# List of tags to be extracted:
# ============================
#
# Revisions from 'ci20-v3.18' branch used for MIPS Creator CI20 (jz4780 based).
#
#                                               hash |  branch | date
#            ----------------------------------------+---------+--------
revisions  = 8ef5089c1baf62db99f0855d49bd2fb9b89be685:ci20-3.18:20150313
revisions += 7732fdf2465ef07a39eacb05829f7fe355f2df62:ci20-3.18:20150820
revisions += 235d926f0e6a07983170e990e9c1bdc5384a1e57:ci20-3.18:20150828
revisions += a0005ba52d069a5ad328f3d242818478ea85845f:ci20-3.18:20151015
revisions += cdca433c70b6600a0f6cd7898f21492d3903d4b0:ci20-3.18:20160210
#
# Revisions from 'ci20-v3.0.8' branch used for MIPS Creator CI20 (jz4780 based).
#
#                                               hash |   branch | date
#            ----------------------------------------+----------+--------
revisions += 2e5af7d6650ce6435f2894bdd7ee7f0333950942:ci20-3.0.8:20150218
revisions += c52aae2473591e25305239c4d62c176435f21e31:ci20-3.0.8:20150728

#
# Default Linux config file name:
#
_defconfig = ci20_defconfig

git_repo   = .git_clone

versions   = $(foreach tag, $(revisions), $(addprefix $(shell echo $(tag) | cut -f 2 -d ':')-, $(shell echo $(tag) | cut -f 3 -d ':')))

tarballs   = $(addsuffix .tar.bz2, $(addprefix linux-, $(versions)))
defconfigs = $(addsuffix .defconfig, $(addprefix linux-, $(versions)))
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
	  if [ ! -f linux-$$branch-$$date.tar.bz2 ]; then \
	    echo -e "\n======= Creating 'linux-$$branch-$$date.tar.bz2' snapshot =======" ; \
	    ( cd $(repo_name) && \
	      git archive --format=tar --prefix=linux-$$branch-$$date/ $$hash | \
	      bzip2 >../linux-$$branch-$$date.tar.bz2 ) ; \
	  fi ; \
	done

$(defconfigs): %.defconfig: %.tar.bz2
	@for arch in $< ; do \
	  version=`echo $$arch | sed 's/\(^[a-zA-Z]*\)\(-\)\([a-zA-z0-9]*-[0-9][.0-9]*-[0-9]*\)\(.tar.bz2\)/\3/'` ; \
	  defcfg=$(_defconfig) ; \
	  echo -e "\n======= Extracting default '.config' from '$$arch' tarball =======" ; \
	  ( tar -xjf $$arch \
	            linux-$$version/arch/mips/configs/$$defcfg && \
	   cp linux-$$version/arch/mips/configs/$$defcfg linux-$$version.defconfig && \
	   rm -rf linux-$$version ) ; \
	done
	@chmod a-x *.defconfig

$(sha1s): %.tar.bz2.sha1sum : %.tar.bz2
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

repository_clean: $(defconfigs) $(sha1s)
	@echo -e "\n======= Remove cloned $(repo_name).git repository =======\n"
	@rm -rf $(git_repo) $(repo_name)

downloads_clean:
	@rm -rf $(tarballs) $(defconfigs) $(sha1s)
	@rm -rf $(git_repo) $(repo_name)
