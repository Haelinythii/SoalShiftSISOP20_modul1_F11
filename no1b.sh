#!/bin/bash

awk -F "\t" '
BEGIN {n=9999999.0; idx=0; split("",states)}
{reg=$13; stateTemp=$11;
	if(reg=="Central")
	{
		k=0
		for(key in states)
		{
			if(states[k] == stateTemp)
			{
				profits[k]=profits[k]+$21+0
				stateTemp="sudah"
				break
			}
			k=k+1;
		}
		if(stateTemp!="sudah")
		{
			profits[k]=$21+0
			states[k]=stateTemp
		}
	}
}
END {l=0
n=length(profits)

for(i=0; n-1>i; i++)
{
	minidx=i
	for(j=i+1; n > j; j++)
	{
		if(profits[j]<profits[minidx])
		{
			minidx=j
		}
	} 
	
	temp=profits[i]
	profits[i] = profits[minidx]
	profits[minidx]=temp

	temp=states[i]
	states[i]=states[minidx]
	states[minidx]=temp
}
print states[0],profits[0]
print states[1],profits[1]
}' Sample-Superstore.tsv
