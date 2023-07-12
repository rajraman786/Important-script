#!/bin/bash


# Define the source and destination directories
src_dir="/mnt/new_storage2/permission1/apk"
dest_dir="/mnt/new_storage2/permission1/application"
sudo rm -rf "$src_dir"/*
sudo rm -rf "$dest_dir"/*


if [ -f progressd.txt ]; then
tmp=$(cat progressd.txt)
else
tmp=1
fi
lines=$(cat link1.txt | wc -l)

# Read the URLs from the text file

while ((tmp <= lines))
 do
 a=$(sed -n "${tmp}p" link1.txt)
b=$(sed -n "${tmp}p" list1.txt)
  p=$(echo "$a" | tr -d ' ')
echo "$tmp"
name=$b.apk
Download the APK file using wget
wget "$p" -O "$src_dir/$name"

filename=$(basename "$name" .apk)

apktool d "$src_dir/$name" -o "$dest_dir/$filename"
mv -- "$src_dir/$name" "/mnt/new_storage2/permission1/apk-files"
if [ -f $dest_dir/$filename/AndroidManifest.xml ]; then
mv -- $dest_dir/$filename/AndroidManifest.xml "/mnt/new_storage2/permission1/manifest-file/$filename.xml"
else
apktool d "$dest_dir/$filename/unknown/$name" -o "$dest_dir/$filename/unknown/$filename"
mv -- $dest_dir/$filename/unknown/$filename/AndroidManifest.xml "/mnt/new_storage2/permission1/manifest-file/$filename.xml"



sudo rm -rf "$src_dir"/*
sudo rm -rf "$dest_dir"/*
sudo rm -f /mnt/new_storage2/permission1/wget-log*
let tmp=$((tmp+1))
echo "$tmp" > progressd.txt

done

