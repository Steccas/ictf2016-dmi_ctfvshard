#!/bin/bash

#dopo aver abilitato selinux (permissive) e riavviato

#package
yum install rpm-plugin-selinux selinux-policy selinux-policy-targeted selinux-policy-devel policycoreutils policycoreutils-python policycoreutils-gui libselinux libselinux-python libselinux-utils setroubleshoot-server system-config-services setools setools-gui setools-devel setools-console mcstrans setroubleshoot

#redefind context __defautl user__

semanage login -m -S targeted -s "system_u" -r s0 __default__

#setsebool -P httpd_enable_homedirs on
setsebool -P openvpn_can_network_connect off
setsebool -P selinuxuser_execmod off
setsebool -P openvpn_enable_homedirs off
setsebool -P telepathy_tcp_connect_generic_network_ports off
setsebool -P selinuxuser_execstack off
setsebool -P postgresql_selinux_users_ddl off

touch /.autorelabel
reboot