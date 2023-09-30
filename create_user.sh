#!/bin/bash

adduser --disabled-password --gecos "" $2$1
usermod -G sudo $2$1
echo $2$1:1234 | chpasswd