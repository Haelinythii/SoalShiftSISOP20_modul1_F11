#!/bin/bash

folderName="duplicate"
if [ ! -d "$folderName" ]
then
	mkdir "$folderName"
fi

folderName="kenangan"
if [ ! -d "$folderName" ]
then
	mkdir "$folderName"
fi

> location.log
> wget.log
i=1
name1="pdkt_kusuma_"
name2="duplicate_"
name3="kenangan_"

while [ $i -lt 29 ]
do
	str1="$name1$i"
	DL="https://loremflickr.com/320/240/cat"

	wget -O $str1 $DL -a "wget.log"
	i=$((i + 1))
done

grep 'Location' "wget.log" >> "location.log"
i=1

while [ $i -lt 29 ]
do
	str1="$name1$i"
	cek1=$(cat location.log | head -$i | tail -1)
	j=1
	p=0
	limit=$(ls -1 | grep ^pdkt | wc -l)

	while [ $p -lt $limit ] 
	do
		if [ $i -ne $j ]
		then
			if [ -f "$name1$j" ]
			then
			cek2=$(cat location.log | head -$j | tail -1)
				if [ "$cek1" == "$cek2" ]
				then
				count=$(ls -1 ./duplicate | wc -l)
				count=$((count + 1))
				str2="$name2$count"
				mv $str1 $str2
				mv $str2 ./duplicate
				break
				fi
			fi
		fi
		j=$((j + 1))
		p=$((p + 1))
	done

	i=$((i + 1))
done

i=0
j=1
limit=$(ls -1 | grep ^pdkt | wc -l)

while [ $i -lt $limit ]
do	
	if [ -f "$name1$j" ]
	then
		str1="$name1$j"
		count=$(ls -1 ./kenangan | wc -l)
		count=$((count + 1))
		str2="$name3$count"
		mv $str1 $str2
		mv $str2 ./kenangan

		i=$((i + 1))
	else
		j=$((j + 1))
	fi
done

cat wget.log >> wget.log.bak
cat location.log >> location.log.bak
