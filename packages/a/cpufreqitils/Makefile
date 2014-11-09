#
# Project Home:
# ============
# http://mirrors.dotsrc.org/linux/utils/kernel/cpufreq/cpufrequtils.html
# http://mirrors.dotsrc.org/linux/utils/kernel/cpufreq/hardware.html
#
# Downloads:
# =========
# http://mirrors.dotsrc.org/linux/utils/kernel/cpufreq
#
# Mirrors:
# =======
# http://mirror.linux.org.au/linux/utils/kernel/cpufreq/cpufrequtils.html
# http://mirror.linux.org.au/linux/utils/kernel/cpufreq/hardware.html
# http://mirror.linux.org.au/linux/utils/kernel/cpufreq
#

url       = http://mirrors.dotsrc.org/linux/utils/kernel/cpufreq

versions  = 008
pkg_name  = cpufrequtils
arch_type = tar.bz2
suffixes  = $(arch_type) tar.sign

files     = $(foreach suffix, $(suffixes), $(addsuffix .$(suffix), $(addprefix $(pkg_name)-, $(versions))))
tarballs  = $(addsuffix .$(arch_type), $(addprefix $(pkg_name)-, $(versions)))
sha1s     = $(addsuffix .sha1sum, $(tarballs))


all: $(files) $(sha1s)


.PHONY: downloads_clean

$(files):
	@echo -e "\n======= Downloading '$(pkg_name)' sourses =======\n"
	@for version in $(versions) ; do \
	  for suffix in $(suffixes) ; do \
	    wget -N $(url)/$(pkg_name)-$$version.$$suffix ;  \
	  done ; \
	done

$(sha1s): %.$(arch_type).sha1sum : %.$(arch_type)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -f $(files) $(sha1s)
