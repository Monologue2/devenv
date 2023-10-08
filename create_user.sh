#!/bin/bash

#Make User
adduser --disabled-password --gecos "" "$USERNAME"
usermod -aG sudo $USERNAME

#Change User Password
echo $USERNAME:$ID | chpasswd

#Change Home Directory owner
chown -R $USERNAME:$USERNAME /home/$USERNAME/