# Foobar

Foobar is a Python library for dealing with word pluralization.

## Soal Nomor 1

### a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

#### Penyelesaian menggunakan awk:

```bash
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
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13; if(reg != "Region"){profits[reg]=profits[reg]+$21+0}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg, lalu mencek apakah reg="Region" untuk memilah baris pertama yaitu title tiap kolom. Lalu memasukkan nilai profit ke dalam sebuah array dengan index regionnya.

Block END:
* `print "Region dengan profit terkecil:"` digunakan untuk print tulisan "Region dengan profit terkecil:"
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `for(i=1; 2>i; i++)
    {
        print keysBackup[sortedProfits[i]], sortedProfits[i]
    };` untuk print value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya





### b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

```bash
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
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13; stateTemp=$11; if(reg=="Central") {profits[stateTemp] = profits[stateTemp] +$21 +0}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg dan kolom 11 ke stateTemp, lalu mencek apakah reg="Central", yang merupakan region dengan profit terkecil. Lalu memasukkan dan mengakumulasikan nilai profit ke dalam sebuah array dengan index state.

Block END:
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `print "print "2 State yang memiliki profit paling kecil: "` digunakan untuk print tulisan "2 State yang memiliki profit paling kecil: "
* `for(i=1; 3>i; i++)
    {
        print backupKeys[sortedProfits[i]], sortedProfits[i]
    }` untuk print value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya



### c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

```bash
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
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13;productTemp=$17; stateTemp=$11;
	if(reg=="Central" && (stateTemp=="Texas" || stateTemp=="Illinois"))
	{
		profits[productTemp]=profits[productTemp]+$21+0
	}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg, kolom 11 ke stateTemp, dan Kolom 17 ke productTemp lalu mencek apakah reg="Central", yang merupakan region dengan profit terkecil dan stateTemp texas dan illinois, yang merupakan 2 state dengan profit terkecil di region central. Lalu memasukkan dan mengakumulasikan nilai profit ke dalam sebuah array dengan index nama productnya.

Block END:
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `print "10 Barang yang memiliki profit paling kecil:"` digunakan untuk print tulisan "10 Barang yang memiliki profit paling kecil:"
* `for(p=1; 11>p; p++)
    {
        print keysBackup[sortedProfits[p]], sortedProfits[p]
    }` untuk print 10 value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya
