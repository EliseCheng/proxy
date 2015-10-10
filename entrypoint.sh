#!/bin/bash
passwd <<EOF
${ROOTPASS}
${ROOTPASS}
EOF

/usr/bin/sshd-keygen
/usr/sbin/sshd -D
/usr/sbin/squid start
stunnel /etc/stunnel/stunnel.conf

netstat -ano

while true;do sleep 10;  done