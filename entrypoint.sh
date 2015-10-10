#!/bin/bash
passwd <<EOF
${ROOTPASS}
${ROOTPASS}
EOF

/etc/rc.d/init.d/squid start

stunnel /etc/stunnel/stunnel.conf