#
# Project Home:
# ============
# http://www.procmail.org
#
# Downloads:
# =========
# ftp://ftp.procmail.net/pub/procmail
#
# MIRRORS:
# =======
# ftp://ftp.ucsb.edu/pub/mirrors/procmail/
# ftp://ftp.informatik.rwth-aachen.de/pub/packages/procmail/
# ftp://ftp.fu-berlin.de/pub/unix/mail/procmail/
# ftp://ftp.fu-berlin.de/pub/unix/mail/smartlist/
# ftp://ftp.net.ohio-state.edu/pub/networking/mail/procmail/
# ftp://ftp.fdt.net/pub/unix/packages/procmail/
# ftp://ftp.tamu.edu/pub/mirrors/procmail/
# ftp://ftp.kfki.hu/pub/packages/mail/procmail/
# ftp://giswitch.sggw.waw.pl/pub/unix/procmail/
# ftp://ftp.meltzer.org/pub/procmail/
# ftp://ftp.win.ne.jp/pub/network/mail/procmail/
# http://www.ring.gr.jp/archives/net/mail/procmail/
# ftp://ftp.ring.gr.jp/pub/net/mail/procmail/
# ftp://ftp.ayamura.org/pub/procmail/
# ftp://sunsite.cnlab-switch.ch/mirror/procmail/
# ftp://ftp.linja.net/pub/mirrors/procmail/
# ftp://ftp.stealth.net/pub/mirrors/ftp.procmail.org/pub/procmail/
# ftp://ftp.mirror.ac.uk/sites/ftp.procmail.org/pub/procmail/
# ftp://mirrors.unam.mx/pub/procmail/


url         = ftp://ftp.fu-berlin.de/pub/unix/mail/procmail

versions    = 3.21 3.22
pkgname     = procmail
suffix      = tar.gz
sign_suffix = sig

tarballs    = $(addsuffix .$(suffix), $(addprefix $(pkgname)-, $(versions)))
signatures  = $(addsuffix .$(sign_suffix), $(tarballs))
sha1s       = $(addsuffix .sha1sum, $(tarballs))


all: $(tarballs) $(signatures) $(sha1s)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading source tarballs =======\n"
	@for tarball in $(tarballs) ; do \
	  wget -N $(url)/$$tarball ; \
	done

$(signatures): %.$(suffix).$(sign_suffix) : %.$(suffix)
	@for signature in $@ ; do \
	  echo -e "\n======= Downloading '$$signature' signature =======\n" ; \
	  wget -N $(url)/$$signature ; \
	  touch $$signature ; \
	done

$(sha1s): %.$(suffix).sha1sum : %.$(suffix)
	@for tarball in $< ; do \
	  echo -e "\n======= Calculation the '$$tarball' sha1sum =======\n" ; \
	  sha1sum --binary $$tarball > $$tarball.sha1sum ; \
	done

downloads_clean:
	@rm -rf $(tarballs) $(signatures) $(sha1s)
