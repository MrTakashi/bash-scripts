#!/bin/bash

###########################################################################################
# wget -qO - https://raw.githubusercontent.com/MrTakashi/bash-scripts/master/change-zabbix-agent2-settings.sh | bash -s %new_Hostname=% %new_Server=%


if [ -z "$1" ]; then
    echo "[Zabbix agent2 Hostname= and Server= settings changing script]"
    echo
    echo "Usage: $0 %new_Hostname% %new_Server%"
    echo
    echo "script will execute:"
    echo "cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak"
    echo "sed -r 's/^Hostname=.*/Hostname=%s/' /etc/zabbix/zabbix_agent2.conf" "$1"
    echo "sed -r 's/^Server=.*/Server=%s/' /etc/zabbix/zabbix_agent2.conf" "$2"
else
    echo
    echo "cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak"
    cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak
    echo "grep Hostname= /etc/zabbix/zabbix_agent2.conf"
    grep Hostname= /etc/zabbix/zabbix_agent2.conf
    echo "grep Server= /etc/zabbix/zabbix_agent2.conf"
    grep Server= /etc/zabbix/zabbix_agent2.conf
    echo
    printf "### try to update /etc/zabbix/zabbix_agent2.conf with command: sed -r s/^Hostname=.*/Hostname=%s/ /etc/zabbix/zabbix_agent2.conf" "$1"
    sed -r "s/^Hostname=.*/Hostname=$1/" /etc/zabbix/zabbix_agent2.conf
    echo
    printf "### try to update /etc/zabbix/zabbix_agent2.conf with command: sed -r s/^Server=.*/Server=%s/ /etc/zabbix/zabbix_agent2.conf" "$2"
    sed -r "s/^Server=.*/Server=$1/" /etc/zabbix/zabbix_agent2.conf
    echo
    echo
    echo "If all seems correct, run:"
    echo "# systemctl restart zabbix-agent2"
    echo "# zabbix_agent2 -p"
    echo "# tail -f /var/log/zabbix/zabbix_agent2.log"
    echo
fi

# test changes