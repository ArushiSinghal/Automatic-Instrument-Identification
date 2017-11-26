#!/bin/bash
#Script: mp32wav script (requires mpg123 package)
#Purpose: Loops through a path and convert all the mp3s to wavs
#
#usage: mp32wav [Path]

count=0

if [ -n "$1" ]; then
   cd "$1"
   ls
   for file in *.mp3
	do
	let "count += 1"
          echo "$1/$file" > sedEdit
          name =`echo "$file" | cut -d'.' -f1`
          mpg123 -w ./waves/${file}.wav $file
	done
fi
echo "$count mp3s found and converted to wavs... [Baileysoft 2005]"
rm sedEdit
exit 0
