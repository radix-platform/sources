
#
# Following command helps to cheate SUBDIRS list:
# $ tree -fid .
#

SUBDIRS := ModemManager           \
           alpine                 \
           autofs                 \
           biff+comsat            \
           bind                   \
           bluez                  \
           bluez-firmware         \
           bluez-hcidump          \
           bootp                  \
           bootp-debian           \
           bridge-utils           \
           bsd-finger             \
           ca-certificates        \
           ca-certificates-deb    \
           cifs-utils             \
           conntrack-tools        \
           crda                   \
           curl                   \
           cyrus-sasl             \
           dhcp                   \
           dhcpcd                 \
           dirmngr                \
           dnsmasq                \
           ebtables               \
           egd                    \
           elm                    \
           epic5                  \
           ethtool                \
           fetchmail              \
           firmware               \
           getmail                \
           gnupg                  \
           gnupg2                 \
           gnutls                 \
           gpa                    \
           gpgme                  \
           htdig                  \
           httpd                  \
           icmpinfo               \
           idnkit                 \
           iftop                  \
           inetd                  \
           iperf3                 \
           iproute2               \
           ipset                  \
           iptables               \
           iptraf-ng              \
           iputils                \
           irssi                  \
           iw                     \
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
           libnftnl               \
           libnl                  \
           libnl3                 \
           libnsl                 \
           libpcap                \
           libproxy               \
           libqmi                 \
           libtirpc               \
           links                  \
           lynx                   \
           mailx                  \
           maxmind                \
           mcabber                \
           metamail               \
           mozilla-nspr           \
           mozilla-nss            \
           mtr                    \
           mutt                   \
           nc                     \
           ncftp                  \
           net-snmp               \
           net-tools              \
           netatalk               \
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
           netpipes               \
           nettle                 \
           netwatch               \
           netwrite               \
           newspost               \
           nfacct                 \
           nfs-utils              \
           nftables               \
           nmap                   \
           nghttp2                \
           nn                     \
           npth                   \
           nss-pam-ldapd          \
           ntbtls                 \
           ntp                    \
           obex-data-server       \
           obexfs                 \
           obexftp                \
           openldap               \
           openobex               \
           openssh                \
           openssl                \
           openssl10              \
           openvpn                \
           p11-kit                \
           php                    \
           pidentd                \
           pinentry               \
           pinepgp                \
           popa3d                 \
           portmap                \
           postfix                \
           ppp                    \
           pppsetup               \
           procmail               \
           proftpd                \
           pssh                   \
           radius                 \
           radiusclient           \
           rdist                  \
           rfkill                 \
           rp-pppoe               \
           rpcbind                \
           rpcsvc-proto           \
           rsync                  \
           samba                  \
           scute                  \
           sendmail               \
           slrn                   \
           snownews               \
           stunnel                \
           tcp_wrappers           \
           tcpdump                \
           telnet-OpenBSD         \
           tftp-hpa               \
           tin                    \
           traceroute             \
           trn                    \
           trn4                   \
           ulogd                  \
           vlan                   \
           vsftpd                 \
           whois                  \
           wireless-regdb         \
           wireless-tools         \
           wpa_supplicant         \
           yp                     \
           ytalk


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
