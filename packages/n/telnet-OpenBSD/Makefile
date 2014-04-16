#
# Project Home:
# ============
# http://slackware.com
#
# Downloads:
# =========
# http://mirrors.slackware.com/slackware/slackware-14.1/source/n/telnet
#

url         = http://mirrors.slackware.com/slackware/slackware-14.1/source/n/telnet

version     = 20020321
pkgname     = telnet-OpenBSD
suffix      = tar.gz

tarball     = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(version)))
sha1s       = $(addsuffix .sha1sum, $(tarball))
patches     = $(addsuffix .diff.gz, $(addprefix $(pkgname)-, $(version)))
patches    += $(addsuffix .diff.gz, $(addprefix $(pkgname)-, 014_telnet))


all: $(tarball) $(patches) $(sha1s)

.PHONY: downloads_clean


$(tarball):
	@echo -e "\n======= Downloading source tarball =======\n"
	wget -N $(url)/$(tarball)

$(patches): $(tarball)
	@echo -e "\n======= Downloading patch and description =======\n"
	@for file in $(patches) ; do \
	  wget -N $(url)/$$file ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarball) $(patches) $(sha1s)
