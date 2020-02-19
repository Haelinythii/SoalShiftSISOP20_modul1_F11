#!/bin/bash

awk -F "\t" '
BEGIN {n=9999999.0; idx=0; split("",products)}
{productTemp=$17; stateTemp=$11;
	if(stateTemp=="Texas" || stateTemp=="Illinois")
	{
		k=0
		for(key in products)
		{
			if(products[k] == productTemp)
			{
				profits[k]=profits[k]+$21+0
				productTemp="sudah"
				break
			}
			k=k+1;
		}
		if(productTemp!="sudah")
		{
			profits[k]=$21+0
			products[k]=productTemp
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

	temp=products[i]
	products[i]=products[minidx]
	products[minidx]=temp
}
for(p=0; 10>p; p++)
{
	print products[p],profits[p]
}

}' Sample-Superstore.tsv
