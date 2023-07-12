#!/bin/bash


# Define the source and destination directories
src_dir="/mnt/new_storage2/new1/apk"
dest_dir="/mnt/new_storage2/new1/application"

sudo rm -rf "$dest_dir"/*


if [ -f progressc.txt ]; then
tmp=$(cat progressc.txt)
else
tmp=1
fi
lines=$(cat list1.txt | wc -l)



while ((tmp <= lines))
 do

b=$(sed -n "${tmp}p" list1.txt)

echo "$tmp"
name=$b.apk


filename=$(basename "$name" .apk)

apktool d "$src_dir/$name" -o "$dest_dir/$filename"

if [ -f $dest_dir/$filename/AndroidManifest.xml ]; then
mv -- $dest_dir/$filename/AndroidManifest.xml "/mnt/new_storage2/new1/manifest-file/$filename.xml"
else
apktool d "$dest_dir/$filename/unknown/$name" -o "$dest_dir/$filename/unknown/$filename"
mv -- $dest_dir/$filename/unknown/$filename/AndroidManifest.xml "/mnt/new_storage2/new1/manifest-file/$filename.xml"
fi



sudo rm -rf "$dest_dir"/*
sudo rm -f /mnt/new_storage2/new1/wget-log*
let tmp=$((tmp+1))
echo "$tmp" > progressc.txt

done


