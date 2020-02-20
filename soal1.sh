#!/bin/bash

awk -F "\t" '
BEGIN {n=9999999.0; idx=0}
{reg=$13;
if(reg != "Region")
{
	k=0
	for(key in regs)
	{
		if(regs[k] == reg)
		{
			profits[k]=profits[k]+$21+0
			reg="sudah"
			break
		}
		k=k+1;
	}
	if(reg!="sudah")
	{
		profits[k]=$21+0
		regs[k]=reg
	}
}
}
END {
for(i=0;4>i;i++)
{
	if(profits[i] < n)
	{
		n = profits[i]
		idx = i
	}
};print "Region dengan profit terkecil: ";print regs[idx],n,"\n"}' Sample-Superstore.tsv



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

for(i=1; n>i; i++)
{
	profitkey = profits[i]
	statekey = states[i]
	for(y=i-1; y>=0; y=y-1)
	{
		if(profitkey > profits[y])
		{
			break
		}
		profits[y+1] = profits[y]
		states[y+1]=states[y]
	}
	profits[y+1] = profitkey
	states[y+1] = statekey
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

for(i=1; n>i; i++)
{
	profitkey = profits[i]
	productkey = products[i]
	for(y=i-1; y>=0; y=y-1)
	{
		if(profitkey > profits[y])
		{
			break
		}
		profits[y+1] = profits[y]
		products[y+1] = products[y]
	}
	profits[y+1] = profitkey
	products[y+1] = productkey
}
print "10 Barang yang memiliki profit paling kecil:"
for(p=0; 10>p; p++)
{
	print products[p],profits[p]
}
print "\n"

}' Sample-Superstore.tsv
