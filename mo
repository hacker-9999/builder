#!/bin/bash
export CCACHE_DIR=/tmp/ccache
sleep 2m

while :
do
ccache -s
echo ''
top -b -i -n 1
sleep 1m
done
