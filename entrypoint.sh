#!/bin/bash
passwd <<EOF
${ROOTPASS}
${ROOTPASS}
EOF

/usr/sbin/squid start
stunnel /etc/stunnel/stunnel.conf
netstat -ano
/usr/sbin/sshd -D

while true;do sleep 10;  done