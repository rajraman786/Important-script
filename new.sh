#!/bin/bash

lines=$(cat common_entries1.txt | wc -l)

# Read the URLs from the text file

tmp=1

while ((tmp <= lines))
do
  a=$(sed -n "${tmp}p" common_entries1.txt)
  p=$(echo "$a" | tr -d ' ')
  let tmp=$((tmp+1))
  ls manifest-files/ | grep "$p" >> output.txt
done
