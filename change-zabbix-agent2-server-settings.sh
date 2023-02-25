#!/bin/bash

###########################################################################################
# wget -qO - https://raw.githubusercontent.com/MrTakashi/bash-scripts/c01a68534e8b3f5696139bd27da7129182404045/change-zabbix-agent2-server-settings.sh | bash -s %new_value_for_Server=%


if [ -z "$1" ]; then
    echo "[Zabbix agent2 Server= settings changing script]"
    echo
    echo "Usage: $0 <new-Server-value>"
    echo
    echo "script will execute <sed -i.bak -r 's/^Server=.*/Server=%s/' /etc/zabbix/zabbix_agent2.conf>" "$1"
else
    echo
    echo "### try to update /etc/zabbix/zabbix_agent2.conf with command: sed -i.bak -r 's/^Server=.*/Server=%s/' /etc/zabbix/zabbix_agent2.conf" "$1"
    echo "grep Server= /etc/zabbix/zabbix_agent2.conf"
    grep Server= /etc/zabbix/zabbix_agent2.conf
    echo
    sed -i.bak -r "s/^Server=.*/Server=$1/' /etc/zabbix/zabbix_agent2.conf" /etc/hosts
    echo
    echo "grep Server= /etc/zabbix/zabbix_agent2.conf"
    grep Server= /etc/zabbix/zabbix_agent2.conf
    echo
    echo "If all seems correct, run:"
    echo "# systemctl restart zabbix-agent2"
    echo "# zabbix_agent2 -p"
    echo "# tail -f /var/log/zabbix/zabbix_agent2.log"
    echo
fi

# test changes
