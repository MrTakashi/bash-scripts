#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <new-host name>"
    echo
    echo "[Host name changer script]"
    echo
    echo "script execute hostnamectl set-hostname "
    echo "and do changes in /etc/hosts"
else
    echo "# try to set new host name with command <hostnamectl set-hostname $1>";
    hostnamectl set-hostname "$1"
    echo
    uname -a
    echo
    printf "# try to update /etc/hosts with command <sed -i.bak -r s/^127.0.1.1.*/127.0.1.1\t%s.local\t%s/ /etc/hosts>", "$1" "$1";
    sed -i.bak -r "s/^127.0.1.1.*/127.0.1.1\t$1.local\t$1/" /etc/hosts
    echo
    cat /etc/hosts
    echo
    echo "if all seems correct, run: shutdown -r now"
    echo
fi