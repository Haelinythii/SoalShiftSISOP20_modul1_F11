#!/bin/bash

awk -F "\t" '
BEGIN {}
{	reg=$13;
	if(reg != "Region")
	{
		profits[reg]=profits[reg]+$21+0
	}
}
END {
	print "Region dengan profit terkecil:"
	for(key in profits) 
		keysBackup[profits[key]]=key
	n = asort(profits, sortedProfits)
	for(i=1; 2>i; i++)
	{
		print keysBackup[sortedProfits[i]], sortedProfits[i]
	};
	print "\n"
}' Sample-Superstore.tsv


awk -F "\t" '
BEGIN {}
{reg=$13; stateTemp=$11;
	if(reg=="Central")
	{
		profits[stateTemp] = profits[stateTemp] +$21 +0
	}
}
END {
	for(key in profits) 
		backupKeys[profits[key]]=key
	n=asort(profits, sortedProfits)
	print "2 State yang memiliki profit paling kecil: "
	for(i=1; 3>i; i++)
	{
		print backupKeys[sortedProfits[i]], sortedProfits[i]
	}
	print "\n"
}' Sample-Superstore.tsv

awk -F "\t" '
BEGIN {}
{reg=$13;productTemp=$17; stateTemp=$11;
	if(reg=="Central" && (stateTemp=="Texas" || stateTemp=="Illinois"))
	{
		profits[productTemp]=profits[productTemp]+$21+0
	}
}
END {
	for(key in profits)
		keysBackup[profits[key]]=key
	asort(profits, sortedProfits)
	print "10 Barang yang memiliki profit paling kecil:"	
	for(p=1; 11>p; p++)
	{
		print keysBackup[sortedProfits[p]], sortedProfits[p]
	}
	print "\n"

}' Sample-Superstore.tsv
