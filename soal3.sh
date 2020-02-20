#!/bin/bash
#https://loremflickr.com/320/240/cat
#https://loremflickr.com/cache/resized/65535_49261393307_6602c650e7_320_240_nofilter.jpg

> location.log
i=1
j=0
name1="pdkt_kusuma_"
name2="duplicate_"
name3="kenangan_"

while [ $i -lt 29 ]
do
index=$(($i - $j))
str1="$name1$index"
DL="https://loremflickr.com/320/240/cat"

wget -O $str1 $DL -o "wget.log"
cat wget.log >> wget.log.bak

cek1=$(grep 'Location' wget.log)
cek1="${cek1##*:}"
cek1="${cek1%% [*}"
cek2=$(grep -o "$cek1" location.log)

if [ "$cek2" == "$cek1" ]
then
count=$(ls -1 ./duplicate | wc -l)
count=$((count + 1))
str2="$name2$count"
mv $str1 $str2
mv $str2 ./duplicate
j=$((j + 1))
else
grep 'Location' "wget.log" >> "location.log"
fi

i=$((i + 1))
done

i=0
j=1
limit=$(ls -1 | grep ^pdkt | wc -l)

while [ $i -lt $limit ]
do
str1="$name1$j"

count=$(ls -1 ./kenangan | wc -l)
count=$((count + 1))
str2="$name3$count"
mv $str1 $str2
mv $str2 ./kenangan

i=$((i + 1))
j=$((j + 1))
done
