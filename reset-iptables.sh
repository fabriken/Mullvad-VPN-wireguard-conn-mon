#!/bin/sh
echo "Stopping IPv4 firewall and allowing everyone..."
ipt="/sbin/iptables"
ip6t="/sbin/ip6tables"
## Failsafe - die if /sbin/iptables not found
[ ! -x "$ipt" ] && { echo "$0: \"${ipt}\" command not found."; exit 1; }
$ipt -P INPUT ACCEPT
$ipt -P FORWARD ACCEPT
$ipt -P OUTPUT ACCEPT
$ipt -F
$ipt -X
$ipt -t nat -F
$ipt -t nat -X
$ipt -t mangle -F
$ipt -t mangle -X
$ipt -t raw -F
$ipt -t raw -X

$ip6t -P INPUT ACCEPT
$ip6t -P FORWARD ACCEPT
$ip6t -P OUTPUT ACCEPT
$ip6t -F
$ip6t -X
$ip6t -t nat -F
$ip6t -t nat -X
$ip6t -t mangle -F
$ip6t -t mangle -X
$ip6t -t raw -F
$ip6t -t raw -X
