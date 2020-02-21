#!/bin/bash

if [ "$1" == "decrypt" ]
then
	str1=$2
	hour=$(ls -l | grep -F "${str1%.*}")
	hour=${hour%%:*}
	hour=${hour##* }

	case "$hour" in
	"01")
	str2=$(echo "${str1%.*}" | tr '[B-ZAb-za]' '[A-Za-z]')
	;;
	"02")
	str2=$(echo "${str1%.*}" | tr '[C-ZA-Bc-za-b]' '[A-Za-z]')
	;;
	"03")
	str2=$(echo "${str1%.*}" | tr '[D-ZA-Cd-za-c]' '[A-Za-z]')
	;;
	"04")
	str2=$(echo "${str1%.*}" | tr '[E-ZA-De-za-d]' '[A-Za-z]')
	;;
	"05")
	str2=$(echo "${str1%.*}" | tr '[F-ZA-Ef-za-e]' '[A-Za-z]')
	;;
	"06")
	str2=$(echo "${str1%.*}" | tr '[G-ZA-Fg-za-f]' '[A-Za-z]')
	;;
	"07")
	str2=$(echo "${str1%.*}" | tr '[H-ZA-Gh-za-g]' '[A-Za-z]')
	;;
	"08")
	str2=$(echo "${str1%.*}" | tr '[I-ZA-Hi-za-h]' '[A-Za-z]')
	;;
	"09")
	str2=$(echo "${str1%.*}" | tr '[J-ZA-Ij-za-i]' '[A-Za-z]')
	;;
	"10")
	str2=$(echo "${str1%.*}" | tr '[K-ZA-Jk-za-j]' '[A-Za-z]')
	;;
	"11")
	str2=$(echo "${str1%.*}" | tr '[L-ZA-Kl-za-k]' '[A-Za-z]')
	;;
	"12")
	str2=$(echo "${str1%.*}" | tr '[M-ZA-Lm-za-l]' '[A-Za-z]')
	;;
	"13")
	str2=$(echo "${str1%.*}" | tr '[N-ZA-Mn-za-m]' '[A-Za-z]')
	;;
	"14")
	str2=$(echo "${str1%.*}" | tr '[O-ZA-No-za-n]' '[A-Za-z]')
	;;
	"15")
	str2=$(echo "${str1%.*}" | tr '[P-ZA-Op-za-o]' '[A-Za-z]')
	;;
	"16")
	str2=$(echo "${str1%.*}" | tr '[Q-ZA-Pq-za-p]' '[A-Za-z]')
	;;
	"17")
	str2=$(echo "${str1%.*}" | tr '[R-ZA-Qr-za-q]' '[A-Za-z]')
	;;
	"18")
	str2=$(echo "${str1%.*}" | tr '[S-ZA-Rs-za-r]' '[A-Za-z]')
	;;
	"19")
	str2=$(echo "${str1%.*}" | tr '[T-ZA-St-za-s]' '[A-Za-z]')
	;;
	"20")
	str2=$(echo "${str1%.*}" | tr '[U-ZA-Tu-za-t]' '[A-Za-z]')
	;;
	"21")
	str2=$(echo "${str1%.*}" | tr '[V-ZA-Uv-za-u]' '[A-Za-z]')
	;;
	"22")
	str2=$(echo "${str1%.*}" | tr '[W-ZA-Vw-za-v]' '[A-Za-z]')
	;;
	"23")
	str2=$(echo "${str1%.*}" | tr '[X-ZA-Wx-za-w]' '[A-Za-z]')
	;;
	*)
	str2=$(echo "${str1%.*}" | tr '[A-Za-z]' '[A-Za-z]')
	;;
	esac

	str2="${str2}.txt"
	mv $str1 $str2

else
	hour=$(date +"%H")
	str=$1
	str="${str//[[:digit:]]/}"

	case "$hour" in
	"01")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[B-ZAb-za]')
	;;
	"02")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[C-ZA-Bc-za-b]')
	;;
	"03")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[D-ZA-Cd-za-c]')
	;;
	"04")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[E-ZA-De-za-e]')
	;;
	"05")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[F-ZA-Ef-za-e]')
	;;
	"06")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[G-ZA-Fg-za-f]')
	;;
	"07")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[H-ZA-Gh-za-g]')
	;;
	"08")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[I-ZA-Hi-za-h]')
	;;
	"09")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[J-ZA-Ij-za-i]')
	;;
	"10")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[K-ZA-Jk-za-j]')
	;;
	"11")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[L-ZA-Kl-za-k]')
	;;
	"12")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[M-ZA-Lm-za-l]')
	;;
	"13")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]')
	;;
	"14")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[O-ZA-No-za-n]')
	;;
	"15")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[P-ZA-Op-za-o]')
	;;
	"16")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[Q-ZA-Pq-za-p]')
	;;
	"17")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[R-ZA-Qr-za-q]')
	;;
	"18")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[S-ZA-Rs-za-r]')
	;;
	"19")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[T-ZA-St-za-s]')
	;;
	"20")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[U-ZA-Tu-za-t]')
	;;
	"21")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[V-ZA-Uv-za-u]')
	;;
	"22")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[W-ZA-Vw-za-v]')
	;;
	"23")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[X-ZA-Wx-za-w]')
	;;
	*)
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[A-Za-z]')
	;;
	esac

	str="${str}.txt"
	pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
	touch $str
	echo $pass > $str
fi
