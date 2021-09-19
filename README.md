# Mullvad wireguard connection monitor and MAC-randomiser
Checks if connected to Mullvad VPN via wireguard and if disconnected, connects to the next random server.

Can be installed as a systemd service with: sudo ./install-wpn.sh

This also runs 'get-latest-servers.sh' to fetch the latest servers.

Or just run ./wpn.sh for temporary use.


if no /etc/wireguard is setup from previous use of wireguard, run ./get-latest-servers.sh to fetch the latest servers.

An iptables killswitch is added to the server.conf files during 'get-latest-servers.sh' to block all connections except wireguard while connected.

if your unable to connect, reset your iptables to default by running ./reset-iptables.sh


Every time a disconnect occurs, the MAC address changes on your NIC for added privacy.


Requires macchanger. Install using your favorite distros package manger:

On Arch Linux or Manjaro:

sudo pacman -S macchanger

On Fedora, CentOS, RHEL:

sudo dnf install macchanger

On Debian, Ubuntu, Linux Mint, Kali Linux:

sudo apt install macchanger
