#!/bin/bash

str=$1
hour=$(stat $1 | grep -F "Modify")
hour=${hour%:*}
hour=${hour%:*}
hour=${hour##* }

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
mv $1 $str

#inode_num=$(stat -c "%i" $1)
#echo $inode_num

#sudo debugfs -R 'stat -c "%i" $1' /dev/sda1
