#!/bin/bash

adduser --disabled-password --gecos "" "$1$2"
usermod -aG sudo $1$2
echo $1$2:$2 | chpasswd
