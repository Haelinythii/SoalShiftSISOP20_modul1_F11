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
};print "Region dengan profit terkecil: ";print name[idx],n,"\n"}' Sample-Superstore.tsv



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
print "2 State yang memiliki profit paling kecil: "
print states[0],profits[0]
print states[1],profits[1],"\n"
}' Sample-Superstore.tsv

awk -F "\t" '
BEGIN {n=9999999.0; idx=0; split("",products)}
{reg=$13;productTemp=$17; stateTemp=$11;
	if(reg=="Central" && (stateTemp=="Texas" || stateTemp=="Illinois"))
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
print "10 Barang yang memiliki profit paling kecil:"
for(p=0; 10>p; p++)
{
	print products[p],profits[p]
}
print "\n"

}' Sample-Superstore.tsv
