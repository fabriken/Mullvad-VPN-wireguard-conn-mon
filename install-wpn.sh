#!/bin/bash +x

/bin/bash get-latest-servers.sh
cp wpn.sh /etc/systemd/system/
cp wpn.service /etc/systemd/system/

systemctl enable wpn.service
systemctl start wpn.service

echo "wpn.service installed successfully."
