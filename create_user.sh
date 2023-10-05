#!/bin/bash

#Make User
adduser --disabled-password --gecos "" "$1$2"
usermod -aG sudo $1$2

#Change User Password
echo $1$2:$2 | chpasswd

#Change Home Directory owner
chown -R $1$2:$1$2 /home/$1$2/