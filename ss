#!/bin/bash
git config --global  user.name "hacker-9999"
git config --global  user.email "aseelpsathar.m3@gmail.com"


#tg
tg(){
	bot_api=$token
	your_telegram_id=$1
	msg=$2
	curl -s "https://api.telegram.org/bot${bot_api}/sendmessage" --data "text=$msg&chat_id=${your_telegram_id}&parse_mode=html"
}

id=272503335
tg $id "juice_ROM _Compile _Status(PE12): TRIGGERED!.
Triggered _at:- $(date)
https://cirrus-ci.com/build/$CIRRUS_BUILD_ID
https://cirrus-ci.com/task/$CIRRUS_TASK_ID"

mkdir -p /tmp/rom
cd /tmp/rom

repo init -q --no-repo-verify --depth=1 -u https://github.com/PixelExperience/manifest -b twelve -g default,-mips,-darwin,-notdefault

git clone https://github.com/hacker-9999/local_manifest/ --depth 1 -b testpe .repo/local_manifests

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

