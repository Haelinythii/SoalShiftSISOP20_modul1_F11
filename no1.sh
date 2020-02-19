#!/bin/bash

awk -F "\t" '
BEGIN {n=9999999.0; idx=0}
{reg=$13;
	if(reg=="Central")
	{
		val[0]=val[0]+$21+0
		name[0]=reg
	}
	else if(reg=="South")
	{
		val[1]=val[1]+$21+0
		name[1]=reg
	}
	else if(reg=="West")
	{
		val[2]=val[2]+$21+0
		name[2]=reg
	}
	else if(reg=="East")
	{
		val[3]=val[3]+$21+0
		name[3]=reg
	}
}
END {
for(i=0;4>i;i++)
{
	if(val[i] < n)
	{
		n = val[i]
		idx = i
	}
};print name[idx] ;print n}' Sample-Superstore.tsv

#awk -F "," '{print $13}' Sample-Superstore.csv
