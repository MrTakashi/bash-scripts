#!/bin/bash

if [ -z "$1" ]; then
    echo "[Host name changer script]"
    echo
    echo "Usage: $0 <new-hostname>"
    echo
    echo "script will execute <hostnamectl set-hostname new-hostname>>"
    echo "and do changes in /etc/hosts"
else
    echo "# try to set new hostname with command <hostnamectl set-hostname $1>";
    hostnamectl set-hostname "$1"
    echo
    echo "uname -a"
    uname -a
    printf "# try to update /etc/hosts with command <sed -i.bak -r s/^127.0.1.1.*/127.0.1.1\t%s.local\t%s/ /etc/hosts>", "$1" "$1";
    sed -i.bak -r "s/^127.0.1.1.*/127.0.1.1\t$1.local\t$1/" /etc/hosts
    echo
    echo "cat /etc/hosts"
    cat /etc/hosts
    echo
    echo "If all seems correct, run: shutdown -r now"
    echo
fi