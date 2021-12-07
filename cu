#!/bin/bash
#tg
tg(){
	bot_api=$token 
	your_telegram_id=$1 
	msg=$2 
	curl -s "https://api.telegram.org/bot${bot_api}/sendmessage" --data "text=$msg&chat_id=${your_telegram_id}&parse_mode=html"
}

id=272503335

cd /tmp

# Compress function with pigz for faster compression
com ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1 # Compression level 1, its enough

tg $id "juice _ROM Compile Status(PE12):
ccache uploading started at:- $(date)."

time rclone copy ccache.tar.gz juice:pe12ccache -P

tg $id "juice ROM Compile Status(PE12):
ccache uploaded at:- $(date)."
