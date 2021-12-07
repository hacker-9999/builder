#!/bin/bash
# Lets see machine specifications and environments
df -h
free -h
nproc
cat /etc/os*
env

mkdir -p ~/.config/rclone
echo "$rclone" > ~/.config/rclone/rclone.conf
