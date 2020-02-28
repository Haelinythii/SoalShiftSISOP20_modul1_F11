#!/bin/bash

i=$RANDOM
i=$((i % 3))

case $i in
	1)
	str="$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)"
	;;
	2)
	str="$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)"
	;;
	*)
	str="$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)"
	;;
esac

z=3
z=$((z - 2))

i=$RANDOM
i=$((i % z))
if [ $i -eq 0 ]
then
	pass="$str"
	if [ $((z + 2)) -gt 3 ]
	then
	pass="$pass$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $((z - 1)) | head -n 1)"
	fi
elif [ $i -eq $((z - 1)) ]
then
	if [ $((z + 2)) -gt 3 ]
	then
	pass="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $((z - 1)) | head -n 1)$str"
	else
	pass="$str"
	fi
else
	pass="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1)"
	i=$((i + 3))
	z=$((z + 2))
	let j=$z-$i
	pass="$pass$str$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $j | head -n 1)"
fi

filename=$1
cek1=${filename#*.}
cek2=$(echo ${filename%.*} | tr -d [A-Za-z])

if [ "$cek2" == "" ]
then
	if [ "$cek1" == "$1" ]
	then
				
		echo $pass > "$filename.txt"
	fi
fi
