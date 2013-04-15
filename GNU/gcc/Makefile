#
# Download: http://www.gnu.org/prep/ftp.html
#
# You can use the generic url http://ftpmirror.gnu.org 
# to automatically choose a nearby and up-to-date mirror.
#
# original url: http://ftp.gnu.org/gnu/gcc/gcc-$(version)
#

gcc_url_prefix  = http://ftpmirror.gnu.org/gcc/gcc

# GCC: 4.4.4 4.5.1 ... separated with space
versions        = 4.5.1 4.7.2

tarballs        = .gcc_tarballs_done

# GMP, MPFR, MPC sites:
 gmp_url        = http://ftpmirror.gnu.org/gmp
mpfr_url        = http://ftpmirror.gnu.org/mpfr
 mpc_url        = http://www.multiprecision.org/mpc/download

# GMP, MPFR, MPC tarbals & signatures:
 gmp_tarballs   = gmp-4.3.1.tar.bz2 gmp-5.0.5.tar.bz2
 gmp_signatures = gmp-4.3.1.tar.bz2.sig gmp-5.0.5.tar.bz2.sig
mpfr_tarballs   = mpfr-2.4.2.tar.bz2 mpfr-3.1.1.tar.bz2
mpfr_signatures = mpfr-2.4.2.tar.bz2.sig mpfr-3.1.1.tar.bz2.sig
 mpc_tarballs   = mpc-0.8.2.tar.gz mpc-1.0.1.tar.gz
 mpc_signatures = mpc-0.8.2.tar.gz.asc mpc-1.0.1.tar.gz.asc


TARGETS  = $(tarballs)
TARGETS += $(gmp_tarballs) $(mpfr_tarballs) $(mpc_tarballs)
TARGETS += $(gmp_signatures) $(mpfr_signatures) $(mpc_signatures)

all: $(TARGETS)

.PHONY: downloads_clean

$(tarballs):
	@echo -e "\n======= Downloading GCC tarballs ======="
	@for version in $(versions) ; do \
	  wget -N $(gcc_url_prefix)-$$version/gcc-$$version.tar.bz2  ; \
	  wget -N $(gcc_url_prefix)-$$version/gcc-$$version.tar.bz2.sig  ; \
	done
	@touch $@

$(gmp_tarballs):
	@echo -e "\n======= Downloading GMP tarballs ======="
	@for tarball in $(gmp_tarballs) ; do \
	  wget -N $(gmp_url)/$$tarball ; \
	done

$(mpfr_tarballs):
	@echo -e "\n======= Downloading MPFR tarballs ======="
	@for tarball in $(mpfr_tarballs) ; do \
	  wget -N $(mpfr_url)/$$tarball ; \
	done

$(mpc_tarballs):
	@echo -e "\n======= Downloading MPC tarballs ======="
	@for tarball in $(mpc_tarballs) ; do \
	  wget -N $(mpc_url)/$$tarball ; \
	done

$(gmp_signatures):
	@echo -e "\n======= Downloading GMP signatures ======="
	@for tarball in $(gmp_signatures) ; do \
	  wget -N $(gmp_url)/$$tarball ; \
	done

$(mpfr_signatures):
	@echo -e "\n======= Downloading MPFR signatures ======="
	@for tarball in $(mpfr_signatures) ; do \
	  wget -N $(mpfr_url)/$$tarball ; \
	done

$(mpc_signatures):
	@echo -e "\n======= Downloading MPC signatures ======="
	@for tarball in $(mpc_signatures) ; do \
	  wget -N $(mpc_url)/$$tarball ; \
	done

downloads_clean:
	@rm -rf gcc-* $(tarballs) \
	        $(gmp_tarballs) $(mpfr_tarballs) $(mpc_tarballs) \
	        $(gmp_signatures) $(mpfr_signatures) $(mpc_signatures)
