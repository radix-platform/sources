
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := biff+comsat            \
           bridge-utils           \
           bsd-finger             \
           ca-certificates        \
           ca-certificates-deb    \
           conntrack-tools        \
           curl                   \
           cyrus-sasl             \
           dhcpcd                 \
           ethtool                \
           gnupg                  \
           gnupg2                 \
           gnutls                 \
           gpa                    \
           gpgme                  \
           icmpinfo               \
           inetd                  \
           iproute2               \
           ipset                  \
           iptables               \
           iptraf-ng              \
           iputils                \
           iputils-git            \
           kerberos               \
           lftp                   \
           libassuan              \
           libgcrypt              \
           libgpg-error           \
           libksba                \
           libmbim                \
           libmnl                 \
           libnetfilter_acct      \
           libnetfilter_conntrack \
           libnetfilter_cthelper  \
           libnetfilter_cttimeout \
           libnetfilter_log       \
           libnetfilter_queue     \
           libnfnetlink           \
           libqmi                 \
           libtirpc               \
           net-snmp               \
           net-tools              \
           netdate                \
           netkit-base            \
           netkit-bootparamd      \
           netkit-combo           \
           netkit-ftp             \
           netkit-ntalk           \
           netkit-routed          \
           netkit-rpc             \
           netkit-rsh             \
           netkit-rusers          \
           netkit-rwall           \
           netkit-rwho            \
           netkit-telnet          \
           netkit-tftp            \
           netkit-timed           \
           nettle                 \
           netwrite               \
           nfacct                 \
           ntp                    \
           openldap               \
           openssh                \
           openssl                \
           p11-kit                \
           rpcbind                \
           tcp_wrappers           \
           telnet-OpenBSD         \
           tftp-hpa               \
           ulogd


all-recursive downloads_clean-recursive:
	@set fnord $(MAKEFLAGS); amf=$$2; \
	target=`echo $@ | sed s/-recursive//`; \
	list='$(SUBDIRS)'; for subdir in $$list; do \
	  echo "Making $$target in $$subdir"; \
	  local_target="$$target"; \
	  (cd $$subdir && $(MAKE) $$fnord $$local_target) \
	   || case "$$amf" in *=*) exit 1;; *k*) fail=yes;; *) exit 1;; esac; \
	done; test -z "$$fail"

all: all-recursive

downloads_clean: downloads_clean-recursive

.PHONY: all-recursive downloads_clean-recursive all downloads_clean
